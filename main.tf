# Main file for the infrastructure

provider "aws"{
    region = "ap-south-1"
}

module "security-group" {
  source = "./Modules/security-group"

  name         = "my-ec2-sg"
  vpc_id       = var.vpc_id
  ingress_rules = local.ingress_rules
  egress_rules  = local.egress_rules
}

module "aws_instance"{
    source             = "./Modules/EC2"
    instance_count     = var.instance_count
    instance_type      = var.instance_type
    ami_id             = var.ami_id
    name_prefix        = var.name_prefix
    subnet_id          = var.subnet_id
    security_group_ids = [module.security-group.security_group_id]
}

module "my_s3_bucket" {
  source      = "./modules/s3_bucket"
  bucket_name = var.bucket_name
  versioning  = var.versioning
  tags        = var.tags
}

module "iam" {
  source        = "./modules/IAM"
  group_name    = var.group_name
  user_name     = var.user_name
  policy_arn    = var.policy_arn
}


