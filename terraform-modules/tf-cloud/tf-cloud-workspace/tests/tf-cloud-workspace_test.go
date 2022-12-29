package tests

import (
	"context"
	"fmt"
	"log"
	"os"
	"testing"
	"time"

	"github.com/gruntwork-io/terratest/modules/random"
	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/hashicorp/go-tfe"
	"github.com/stretchr/testify/assert"
)

const (
	orgName           = "tr3mor"
	retries           = 3
	workingDirectory  = "terraform-modules/tf-cloud/tf-cloud-workspace/tests"
	vcsRepoIdentifier = "tr3mor/personal-infra"
)

func TestTfCloudWorkspace(t *testing.T) {
	t.Parallel()
	uniqueID := random.UniqueId()
	now := time.Now()
	wsName := fmt.Sprintf("e2e-tests-workspace-%s-%s", uniqueID, now.Format("2006-01-02-15-04-05"))
	tfeToken := os.Getenv("TFE_TOKEN")

	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "../",
		Vars: map[string]interface{}{
			"name":                wsName,
			"org_name":            orgName,
			"working_directory":   workingDirectory,
			"vcs_repo_identifier": vcsRepoIdentifier,
		},
		EnvVars: map[string]string{
			"TF_VAR_oauth_token_id": os.Getenv("OAUTH_TOKEN_ID"), // To not show it in logs
		},
	})

	defer terraform.Destroy(t, terraformOptions)

	terraform.InitAndApply(t, terraformOptions)

	config := &tfe.Config{
		Token: tfeToken,
	}
	client, err := tfe.NewClient(config)
	if err != nil {
		log.Fatalf("Failed to create tfe client: %s", err)
	}

	// Test Workspace
	var ws *tfe.Workspace
	ctx := context.Background()
	ws, err = client.Workspaces.Read(ctx, orgName, wsName)

	assert.NoErrorf(t, err, "Failed to get Workspace: %s", err)
	assert.Equal(t, workingDirectory, ws.WorkingDirectory)
	assert.Equal(t, vcsRepoIdentifier, ws.VCSRepo.Identifier)

	// Test NotificationConfiguration
	ns, err := client.NotificationConfigurations.List(ctx, ws.ID, &tfe.NotificationConfigurationListOptions{ListOptions: tfe.ListOptions{
		PageNumber: 1,
		PageSize:   10,
	}})
	assert.NoErrorf(t, err, "Failed to get NotificationConfiguration for workspace: %s", err)
	assert.Equal(t, 1, len(ns.Items), "Unexpected number of NotificationsSettings")
	assert.Equal(t, true, ns.Items[0].Enabled, "Notifications not enabled by default")

	// Wait for Workspace to be unlocked (first run should finish). We cant delete locked Workspace
	for i := 0; i < retries; i++ {
		ws, _ = client.Workspaces.Read(ctx, orgName, wsName)
		if ws.Locked == false {
			break
		} else {
			time.Sleep(30 * time.Second)
		}
	}
}
