variable "project_id" {
  description = "The ID of the project in which to provision resources."
  type        = string
  default     = "terraform-gcp-455215" # Your project ID
}

variable "name" {
  description = "Name of the buckets to create."
  type        = string
  default     = "terraform-gcp-455215-bucket-test1" # Updated unique bucket name
}
