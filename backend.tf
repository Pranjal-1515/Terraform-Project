terraform {
  backend "s3" {
    bucket         = "testing-remotebackend-terraform"
    key            = "storage/terraform.tfstate"
    region         = "ap-south-1" 
 } 
}
