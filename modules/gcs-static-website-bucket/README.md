# GCS Static Website Bucket Module

This module provisions a Google Cloud Storage bucket configured for static website hosting.

## Usage
```hcl
module "gcs-static-website-bucket" {
  source     = "./modules/gcs-static-website-bucket"
  name       = "my-unique-bucket-name"
  project_id = "my-project-id"
  location   = "us-central1"
}
