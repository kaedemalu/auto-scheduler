terraform {
  backend "gcs" {
    bucket      = "shinshu-tf-state"
    prefix      = "state"
    credentials = "credentials.json"
  }
}