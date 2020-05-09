resource "google_project" "shinshu_gke" {
  name       = var.PROJECT_NAME
  project_id = var.PROJECT_ID
}