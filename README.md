# Terraform GCP Modules Lab 🚀

Welcome to the **Terraform GCP Modules Lab**—a hands-on adventure into the world of Infrastructure as Code (IaC) with Terraform and Google Cloud Platform (GCP)! Whether you're provisioning a sleek VPC network or hosting a static website on a GCS bucket, this project has you covered. Built with modularity in mind, it showcases how to wield Terraform modules like a pro—straight from the Terraform Registry and custom-built by you.

---

## Overview 🌍
As you manage your infrastructure with Terraform, your configurations will grow in complexity. While you can maintain everything in a single directory, doing so can lead to several challenges:

- **Difficult navigation & maintenance**: Large configuration files become harder to read and manage.
- **Higher risk of unintended changes**: A small modification in one resource could impact others unexpectedly.
- **Duplication of configurations**: Separate environments (dev, staging, production) may require repeated configurations.
- **Sharing & collaboration issues**: Copy-pasting configurations between teams and projects is error-prone and hard to maintain.

**Modules** solve these problems by providing a structured way to organize, encapsulate, reuse, and enforce best practices in Terraform.

### Objectives 🎯
In this lab, you will:
- **Use a module from the Terraform Registry** to deploy a **VPC** with subnets.
- **Build a custom module** to provision a **Google Cloud Storage (GCS) bucket** for static website hosting.
- **Learn best practices** for structuring Terraform configurations.

---

## Why Use Terraform Modules? 🤔

### ✅ Organize Configuration
Modules break down complex configurations into logical, manageable components. Instead of handling thousands of lines in a single file, you can structure your infrastructure into distinct parts.

### ✅ Encapsulate & Reduce Errors
Modules help prevent unintended side effects by encapsulating configurations into reusable components. This improves security and minimizes mistakes such as duplicate resource names.

### ✅ Reuse & Share Configurations
Reusing pre-built or custom modules saves time and reduces human errors. Modules allow teams to **standardize deployments** and share infrastructure-as-code components effectively.

### ✅ Enforce Consistency & Best Practices
Modules help enforce **security policies** and best practices across environments. For example, you can create a standardized module for public-facing storage buckets to prevent misconfigurations.

---

## What’s Inside? ✨

- **VPC Magic**: Spin up a custom Virtual Private Cloud (VPC) with subnets using a pre-built module from the Terraform Registry.
- **Static Website Wizardry**: Deploy a Google Cloud Storage (GCS) bucket for hosting static websites, complete with lifecycle rules and versioning.

🌍 **Repository**: [GitHub - Terraform GCP Modules Lab](https://github.com/amrahmedgy/Terraform-Modules-GCP)

---

## Project Structure 🗂️
Here’s the lay of the land:
```
Terraform-Modules-GCP/
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
- **GCP Project**: A project with billing enabled (e.g., `YOUR-GCP-PROJECT-ID`).
- **Git**: To clone this repo (`sudo apt install git` on Ubuntu).

---

## Setup: Get Ready to Launch! 🌌

### Step 1: Clone the Repository
Grab the code from GitHub:
```bash
git clone https://github.com/amrahmedgy/Terraform-Modules-GCP.git
cd Terraform-Modules-GCP
```

### Step 2: Authenticate with GCP
Let Terraform talk to your GCP account:
```bash
gcloud auth application-default login
```
- Follow the browser prompt to log in.

### Step 3: Configure Your Variables
Update `variables.tf` files with your GCP project ID and a unique bucket name.

---

## Execution: Deploy Like a Pro! ⚡

### Adventure 1: Provision a VPC Network
1. **Navigate to the Example**:
   ```bash
   cd examples/simple-vpc
   ```
2. **Enable the Compute Engine API**:
   ```bash
   gcloud services enable compute.googleapis.com --YOUR-GCP-PROJECT-ID
   ```
3. **Initialize Terraform**:
   ```bash
   terraform init
   ```
4. **Deploy the VPC**:
   ```bash
   terraform apply
   ```
5. **Clean Up**:
   ```bash
   terraform destroy
   ```

---

### Adventure 2: Host a Static Website on GCS
1. **Return to Root**:
   ```bash
   cd ~/Terraform-Modules-GCP
   ```
2. **Enable the Cloud Storage API**:
   ```bash
   gcloud services enable storage.googleapis.com --YOUR-GCP-PROJECT-ID
   ```
3. **Initialize Terraform**:
   ```bash
   terraform init
   ```
4. **Deploy the Bucket**:
   ```bash
   terraform apply
   ```
5. **Upload a Sample Site** (Optional):
   ```bash
   curl https://raw.githubusercontent.com/hashicorp/learn-terraform-modules/master/modules/aws-s3-static-website-bucket/www/index.html > index.html
   gsutil cp *.html gs://YOUR-BUCKET-NAME
   ```
6. **Clean Up**:
   ```bash
   terraform destroy
   ```

---

## Tips & Tricks 🌟
- **Unique Bucket Names**: GCS names are global. If `YOUR-BUCKET-NAME` fails, append a timestamp (e.g., `-20250330`).
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
