terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "kaedemalu"
 
    workspaces {
      name = "auto-scheduler"
    }
  }
}