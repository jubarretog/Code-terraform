terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.0"
    }
  }
}

# Configure the GitHub Provider
provider "github" {
    token = ""
}

resource "github_repository" "example" {
  name        = "example"
  description = "My awesome codebase"
  auto_init   = true
  visibility = "public"
}

resource "time_sleep" "wait_for_repository" {
  depends_on = [github_repository.example]
  create_duration = "20s"
}

resource "github_branch" "development" {
  repository = "example"
  branch     = "development"
  source_branch = "master"
  depends_on = [time_sleep.wait_for_repository]
}

resource "github_branch" "testing" {
  repository = "example"
  branch     = "testing"
  source_branch = "master"
  depends_on = [time_sleep.wait_for_repository]
}

resource "github_branch" "arquitics" {
  repository = "example"
  branch     = "arquitics"
  source_branch = "master"
  depends_on = [time_sleep.wait_for_repository]
}
