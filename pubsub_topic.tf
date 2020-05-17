resource "google_pubsub_topic" "instance_sucheduler" {
  name = "instance-sucheduler"
}

resource "google_cloud_scheduler_job" "instance_stopper" {
  name        = "instance-stopper"
  description = "instance-stopper"
  schedule    = "* 8 * * 1-5"
  region      = "asia-northeast1"
  time_zone   = "Asia/Tokyo"

  pubsub_target {
    topic_name = google_pubsub_topic.instance_sucheduler.id
    data       = "test"
  }
}

resource "google_cloud_scheduler_job" "instance_starter" {
  name        = "instance-starter"
  description = "instance-starter"
  schedule    = "* 23 * * 1-5"
  region      = "asia-northeast1"
  time_zone   = "Asia/Tokyo"

  pubsub_target {
    topic_name = google_pubsub_topic.instance_sucheduler.id
    data       = "test"
  }
}
