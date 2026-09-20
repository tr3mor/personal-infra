module "mac-hotkeys-powertoys" {
  source = "../../../terraform-modules/github/github-repo"

  name        = "mac-hotkeys-powertoys"
  description = "PowerToys Keyboard Manager config that remaps Windows hotkeys to their macOS equivalents"
  auto_init   = true

  topics = ["powertoys", "keyboard-manager", "windows", "macos", "hotkeys"]
}
