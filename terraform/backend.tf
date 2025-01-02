terraform {
  backend "s3" {
    bucket         = "bucket-idpd-toinho"
    key            = "idp/infra/projectjava/terraform.tfstate"
    region         = "ca-central-1"
  }
}