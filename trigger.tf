resource "google_cloudbuild_trigger" "my-trigger" {
  provider = google
  name     = "hello-world"

  github {
    name = var.github_repository
    owner = var.github_owner
    push {
      branch = var.github_branch
    }
  }

  substitutions = {
    _REGISTRY     = "${var.project}"
    _REGISTRY_URL = "${var.region}-docker.pkg.dev"
    _REGION       = var.region
    _PROJECT_NAME = var.project
  }

  filename = "cloudbuild.yaml"
}