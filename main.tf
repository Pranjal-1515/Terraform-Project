# Main file for the infrastructure

provider "aws"{
    region = "ap-south-1"
}

module "aws_instance"{
    source         = "./Modules/ec2"
    instance_count = var.instance_count
    instance_type  = var.instance_type
    ami_id         = var.ami_id
    name_prefix    = var.name_prefix
}
