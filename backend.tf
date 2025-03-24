
terraform {
  backend "s3" {
    bucket         = "tejaswirajendra-tfsbuck28081998"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-state-locks"
    encrypt        = true
  }
}
