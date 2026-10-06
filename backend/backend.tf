terraform {
  backend "s3" {
    bucket       = "name-of-the-bucket"
    key          = "control-tower-terraform/terraform.tfstate"
    region       = "zone"
    encrypt      = true
    use_lockfile = true
  }
}