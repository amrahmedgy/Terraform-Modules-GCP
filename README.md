# Terraform GCP Modules Lab

This project demonstrates how to use Terraform modules to manage Google Cloud Platform (GCP) infrastructure. It includes two main components:
1. **Using a Terraform Registry Module**: Provisions a VPC network using the `terraform-google-network` module.
2. **Building a Custom Module**: Creates a Google Cloud Storage (GCS) bucket configured for static website hosting.

## Prerequisites
- Google Cloud SDK (`gcloud`) installed and authenticated.
- Terraform installed (version 1.0 or later).
- A GCP project with billing enabled.

## Project Structure
- `examples/simple-vpc/`: Example using the `terraform-google-network` module.
- `modules/gcs-static-website-bucket/`: Custom module for provisioning a GCS static website bucket.
- `main.tf`, `variables.tf`, `outputs.tf`: Root module configuration for the GCS bucket example.

## Setup Instructions
1. Clone this repository:
   ```bash
   git clone https://github.com/<your-username>/terraform-gcp-modules-lab.git
   cd terraform-gcp-modules-lab
