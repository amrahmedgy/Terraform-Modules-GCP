variable "project_id" {
  description = "The project ID to host the network in"
  type        = string
  default     = "terraform-gcp-455215" # Your project ID
}

variable "network_name" {
  description = "The name of the VPC network being created"
  type        = string
  default     = "example-vpc"
}
