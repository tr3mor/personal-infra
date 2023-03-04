package tests

import (
	"context"
	"fmt"
	"github.com/google/go-github/v50/github"
	"github.com/gruntwork-io/terratest/modules/random"
	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
	"golang.org/x/oauth2"
	"os"
	"testing"
	"time"
)

func TestGithubRepo(t *testing.T) {
	t.Parallel()
	uniqueID := random.UniqueId()
	now := time.Now()
	repoName := fmt.Sprintf("unit-test-github-repo-%s-%s", uniqueID, now.Format("2006-01-02-15-04-05"))
	githubToken := os.Getenv("GITHUB_TOKEN")

	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "../",
		Vars: map[string]interface{}{
			"name": repoName,
		},
	})
	defer terraform.Destroy(t, terraformOptions)

	terraform.InitAndApply(t, terraformOptions)
	ctx := context.Background()
	ts := oauth2.StaticTokenSource(
		&oauth2.Token{AccessToken: githubToken},
	)
	tc := oauth2.NewClient(ctx, ts)
	client := github.NewClient(tc)

	repo, _, err := client.Repositories.Get(ctx, "tr3mor", repoName)
	assert.NoErrorf(t, err, "Failed to get repo %s: %s", repoName, err)
	assert.True(t, *repo.AllowAutoMerge, "Automerge should be enabled by default")
	assert.True(t, *repo.AllowSquashMerge, "SquashMerge should be enabled by default")
	assert.True(t, *repo.AllowAutoMerge, "Automerge should be enabled by default")
	assert.True(t, *repo.DeleteBranchOnMerge, "DeleteBranchOnMerge should be enabled by default")

	labels, _, err := client.Issues.ListLabels(ctx, "tr3mor", repoName, nil)
	assert.NoErrorf(t, err, "Failed to get labels for repo %s: %s", repoName, err)

	expectedLabels := []string{"actions", "ansible", "dependencies", "docker", "terraform", "go"}
	for _, x := range expectedLabels {
		assert.Truef(t, checkLabelExists(labels, x), "Label %s doesnt exist", x)
	}
}

func checkLabelExists(labels []*github.Label, labelName string) bool {
	for _, x := range labels {
		if *x.Name == labelName {
			return true
		}
	}
	return false
}
