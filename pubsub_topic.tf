resource "google_pubsub_topic" "instance_sucheduler" {
  name = "instance-sucheduler"
}

resource "google_cloud_scheduler_job" "instance_stopper" {
  name        = "instance-stopper"
  schedule    = "0 8 * * 1-5"
  region      = "asia-northeast1"
  time_zone   = "Asia/Tokyo"

  pubsub_target {
    topic_name = google_pubsub_topic.instance_sucheduler.id
    data       = base64encode("{\"zone\": \"${google_compute_instance.autostop_instance.zone}\", \"instance\": \"${google_compute_instance.autostop_instance.id}\"}")
  }
}

resource "google_cloud_scheduler_job" "instance_starter" {
  name        = "instance-starter"
  schedule    = "0 23 * * 1-5"
  region      = "asia-northeast1"
  time_zone   = "Asia/Tokyo"

  pubsub_target {
    topic_name = google_pubsub_topic.instance_sucheduler.id
    data       = base64encode("{\"zone\": \"${google_compute_instance.autostop_instance.zone}\", \"instance\": \"${google_compute_instance.autostop_instance.id}\"}")
  }
}
