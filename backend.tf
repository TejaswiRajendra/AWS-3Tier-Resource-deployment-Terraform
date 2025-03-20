terraform {
  backend "s3" {
    bucket         = "Terraform-backup"
    key            = "terraform.tfstate"
    region         = var.aws_region
    encrypt        = true
  }
}
