resource "aws_s3_bucket" "terraform_state" {
  bucket = "Terraform-backup"

  lifecycle {
    prevent_destroy = true  # Prevent accidental deletion of the state bucket
  }


  tags = {
    Name        = "Terraform-State-Bucket"
    Environment = "Dev"
  }
}