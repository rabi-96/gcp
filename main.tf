resource "google_compute_instance" "vm_instance" {
  name         = var.instance_name
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-minimal-2404-noble-amd64-v20250722"
      type  = "pd-ssd"
      size  = 20
    }
  }

  network_interface {
    network = "default"

    access_config {
      // Assigns a public IP
    }
  }

  metadata = {
    startup-script = "echo 'VM Rabi initialized successfully' > /var/tmp/init.log"
  }

  tags = ["terraform", "rabi"]
}
