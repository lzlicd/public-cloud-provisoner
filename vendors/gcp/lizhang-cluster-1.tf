//------------------------------------------------------------
// Define your cluster name
variable "cluster-name" {
  default = "lizhang-cluster-1"
}

// Define your cluster region
variable "cluster-region" {
  default = "us-central1-a"
}

// Define how many nodes in your cluster
variable "cluster-node-count" {
  default = "3"
}
//------------------------------------------------------------

  

// Configure the Google Cloud provider
provider "google" {
  credentials = "${file("account.json")}"
  project     = "my-project-06052018"
  region      = "${var.cluster-region}"
}

resource "google_container_cluster" "primary" {
  name               = "${var.cluster-name}"
  zone               = "${var.cluster-region}"
  initial_node_count = "${var.cluster-node-count}"

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
