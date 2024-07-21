terraform {
  backend "s3" {
    bucket = "terraform-clickmark-tf"
    key    = "terraform-hackathon-infra/terraform.tfstate"
    region = "us-east-1"
  }
}