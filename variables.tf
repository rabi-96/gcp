variable "project_id" {
  description = "GCP Project ID"
  type        = string
  default     = "gcp-poc-project-285306"
}

variable "region" {
  description = "GCP Region"
  type        = string
  default     = "asia-south1"
}

variable "zone" {
  description = "GCP Zone"
  type        = string
  default     = "asia-south1-a"
}

variable "instance_name" {
  description = "VM instance name"
  type        = string
  default     = "rabi"
}

variable "machine_type" {
  description = "GCP VM machine type"
  type        = string
  default     = "n1-standard-2"
}
