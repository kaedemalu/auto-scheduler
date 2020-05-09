provider "google" {
  project     = "shinshu-gke"
  credentials = file("credentials.json")

}
