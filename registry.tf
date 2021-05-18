provider "google" {
  credentials = "${file("${var.credential.data}")}"
  project     = "${var.project}" // workplace機能については使ってみたい
  region      = "asia-northeast1"
}

resource "google_project_service" "service" {
  for_each = toset([
    "artifactregistry.googleapis.com"
  ])

  service = each.key

  project = var.project
  disable_on_destroy = false
}