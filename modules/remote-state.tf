terraform {
  backend "s3" {
    bucket         = "usecasehcl170425"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock"
    use_lockfile   = true
    encrypt        = true
  }
}
