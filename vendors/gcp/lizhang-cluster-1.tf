variable "region" {
  default = "us-central1-a"
}

// Configure the Google Cloud provider
provider "google" {
  credentials = "${file("account.json")}"
  project     = "my-project-06052018"
  region      = "${var.region}"
}

resource "google_container_cluster" "primary" {
  name               = "lizhang-gke-cluster"
  zone               = "${var.region}"
  initial_node_count = 1

  master_auth {
    username = ""
    password = ""
  }

  node_config {
    oauth_scopes = [
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]

    labels {
      foo = "bar"
    }

    tags = ["foo", "bar"]
  }
}

# The following outputs allow authentication and connectivity to the GKE Cluster.
output "client_certificate" {
  value = "${google_container_cluster.primary.master_auth.0.client_certificate}"
}

output "client_key" {
  value = "${google_container_cluster.primary.master_auth.0.client_key}"
}

output "cluster_ca_certificate" {
  value = "${google_container_cluster.primary.master_auth.0.cluster_ca_certificate}"
}
