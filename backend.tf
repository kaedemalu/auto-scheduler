# terraform {
#   backend "gcs" {
#     bucket      = "shinshu-tf-state"
#     prefix      = "state"
#     credentials = "credentials.json"
#   }
# }

terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "kaedemalu"
 
    workspaces {
      name = "auto-scheduler"
    }
  }
}