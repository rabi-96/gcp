terraform {
  backend "gcs" {
    bucket = "terraform-state-billmonitor"
    prefix = "terraform/state"
  }
}

provider "google" {
  project = "billmonitor"
  region  = "asia-south1"
  zone    = "asia-south1-a"
}

resource "google_compute_instance" "vm_instance" {
  name         = "rabi"
  machine_type = "n1-standard-2"
  zone         = "asia-south1-a"

  tags = ["rabi", "terraform"]

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-minimal-2404-noble-amd64-v20250722"
      type  = "pd-ssd"
      size  = 20
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }

  metadata = {
    startup-script = "echo 'VM Rabi initialized successfully' > /var/tmp/init.log"
  }
}
