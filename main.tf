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

  visibility = "public"

}
resource "github_branch" "development" {
  repository = "example"
  branch     = "development"
}

resource "github_branch" "testing" {
  repository = "example"
  branch     = "testing"
}

resource "github_branch" "arquitics" {
  repository = "example"
  branch     = "arquitics"
}
