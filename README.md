# Terraform GCP Modules Lab 🚀

Welcome to the **Terraform GCP Modules Lab**—a hands-on adventure into the world of Infrastructure as Code (IaC) with Terraform and Google Cloud Platform (GCP)! Whether you're provisioning a sleek VPC network or hosting a static website on a GCS bucket, this project has you covered. Built with modularity in mind, it showcases how to wield Terraform modules like a pro—straight from the Terraform Registry and custom-built by you.

✨ **What’s Inside?**
- **VPC Magic**: Spin up a custom Virtual Private Cloud (VPC) with subnets using a pre-built module from the Terraform Registry.
- **Static Website Wizardry**: Deploy a Google Cloud Storage (GCS) bucket for hosting static websites, complete with lifecycle rules and versioning.

🌍 **Repository**: https://github.com/amrahmedgy/Terraform-Modules-GCP

---

## Why This Project? 🎯
Terraform modules are the secret sauce to organizing, reusing, and scaling your cloud infrastructure. This lab, inspired by a Google Cloud hands-on exercise, takes you through:
- **Using Existing Modules**: Leverage battle-tested code from the Terraform Registry.
- **Building Your Own**: Craft a reusable module for GCS static website hosting.
- **Real-World GCP**: Deploy and destroy resources in a live GCP environment.

Perfect for beginners and seasoned IaC enthusiasts alike!

---

## Project Structure 🗂️
Here’s the lay of the land:
```
terraform-gcp-modules-lab/
├── examples/               # Ready-to-run examples
│   └── simple-vpc/         # VPC network with subnets
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
├── modules/                # Custom Terraform modules
│   └── gcs-static-website-bucket/
│       ├── website.tf
│       ├── variables.tf
│       ├── outputs.tf
│       ├── README.md
│       └── LICENSE
├── main.tf                 # Root module for GCS bucket
├── variables.tf            # Root variables
├── outputs.tf              # Root outputs
├── README.md               # You’re reading it!
├── LICENSE                 # Apache 2.0 License
└── .gitignore              # Keeps the clutter out
```

---

## Prerequisites ⚙️
Before you embark on this Terraform journey, ensure you have:
- **Google Cloud SDK (`gcloud`)**: Installed and authenticated ([Install Guide](https://cloud.google.com/sdk/docs/install)).
- **Terraform**: Version 1.0 or later ([Install Guide](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)).
- **GCP Project**: A project with billing enabled (e.g., `terraform-gcp-455215`).
- **Git**: To clone this repo (`sudo apt install git` on Ubuntu).

---

## Setup: Get Ready to Launch! 🌌

### Step 1: Clone the Repository
Grab the code from GitHub:
```bash
git clone https://github.com/amrahmedgy/terraform-gcp-modules-lab.git
cd terraform-gcp-modules-lab
```

### Step 2: Authenticate with GCP
Let Terraform talk to your GCP account:
```bash
gcloud auth application-default login
```
- Follow the browser prompt to log in.

### Step 3: Configure Your Variables
Update `variables.tf` files with your GCP project ID and a unique bucket name:
- **Root `variables.tf`** (for GCS bucket):
  ```hcl
  variable "project_id" {
    default = "terraform-gcp-455215" # Your project ID
  }
  variable "name" {
    default = "terraform-gcp-455215-bucket-test1" # Unique bucket name
  }
  ```
- **`examples/simple-vpc/variables.tf`** (for VPC):
  ```hcl
  variable "project_id" {
    default = "terraform-gcp-455215" # Your project ID
  }
  ```

---

## Execution: Deploy Like a Pro! ⚡

### Adventure 1: Provision a VPC Network
Let’s create a VPC with three subnets using the `terraform-google-network` module.

#### Steps:
1. **Navigate to the Example**:
   ```bash
   cd examples/simple-vpc
   ```
2. **Enable the Compute Engine API**:
   ```bash
   gcloud services enable compute.googleapis.com --project=terraform-gcp-455215
   ```
3. **Initialize Terraform**:
   ```bash
   terraform init
   ```
   - Downloads the `terraform-google-network` module and providers.
4. **Deploy the VPC**:
   ```bash
   terraform apply
   ```
   - Review the plan (4 resources: 1 network, 3 subnets).
   - Type `yes` to approve.
   - Output: `network_name = "example-vpc"`, subnet names, etc.
5. **Verify** (Optional):
   - Check GCP Console: `Networking > VPC network`.
6. **Clean Up**:
   ```bash
   terraform destroy
   ```
   - Type `yes` to tear it down.

---

### Adventure 2: Host a Static Website on GCS
Deploy a GCS bucket with versioning and lifecycle rules, then upload a sample site.

#### Steps:
1. **Return to Root**:
   ```bash
   cd ~/terraform-gcp-modules-lab
   ```
2. **Enable the Cloud Storage API**:
   ```bash
   gcloud services enable storage.googleapis.com --project=terraform-gcp-455215
   ```
3. **Initialize Terraform**:
   ```bash
   terraform init
   ```
   - Sets up the custom `gcs-static-website-bucket` module.
4. **Deploy the Bucket**:
   ```bash
   terraform apply
   ```
   - Review the plan (1 bucket: `terraform-gcp-455215-bucket-test1`).
   - Type `yes` to approve.
   - Output: `bucket-name` with bucket details.
5. **Upload a Sample Site** (Optional):
   ```bash
   curl https://raw.githubusercontent.com/hashicorp/learn-terraform-modules/master/modules/aws-s3-static-website-bucket/www/index.html > index.html
   curl https://raw.githubusercontent.com/hashicorp/learn-terraform-modules/master/modules/aws-s3-static-website-bucket/www/error.html > error.html
   gsutil cp *.html gs://terraform-gcp-455215-bucket-test1
   ```
   - Visit: `https://storage.cloud.google.com/terraform-gcp-455215-bucket-test1/index.html`.
6. **Clean Up**:
   ```bash
   terraform destroy
   ```
   - Type `yes` to remove the bucket.

---

## Tips & Tricks 🌟
- **Unique Bucket Names**: GCS names are global. If `terraform-gcp-455215-bucket-test1` fails, append a timestamp (e.g., `-20250330`).
- **API Delays**: Wait 2-5 minutes after enabling APIs if errors persist.
- **GitHub Updates**: Made a tweak? Push it:
  ```bash
  git add .
  git commit -m "Your update message"
  git push
  ```

---

## License 📜
This project is licensed under the Apache 2.0 License. See [LICENSE](LICENSE) for the full details.

---

## Contribute or Say Hi! 👋
Found a bug? Want to add flair? Open an issue or PR at https://github.com/amrahmedgy/Terraform-Modules-GCP. Questions? Ping me on GitHub!

Happy Terraforming! 🎉
