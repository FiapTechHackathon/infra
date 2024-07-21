resource "aws_s3_bucket" "hackathon-bucket" {

  bucket = var.BUCKET

  tags = {
    Name        = "Bucket HACKATHON Fiap Tech"
    Environment = "Dev"
  }
}