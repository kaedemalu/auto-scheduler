resource "google_compute_instance" "autostop_instance" {
  name         = "autostop-instance"
  machine_type = "f1-micro"
  zone         = "asia-northeast1-b"
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10-buster-v20200413"
    }
  }
  network_interface {
    network = "default"
    access_config {
      nat_ip       = "34.84.64.51"
      network_tier = "PREMIUM"
    }
  }

  service_account {
    email = "73420669440-compute@developer.gserviceaccount.com"
    scopes = [
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring.write",
      "https://www.googleapis.com/auth/service.management.readonly",
      "https://www.googleapis.com/auth/servicecontrol",
      "https://www.googleapis.com/auth/trace.append",
    ]
  }
}