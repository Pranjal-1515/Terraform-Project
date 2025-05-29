instance_count = 1
ami_id         = "ami-0e35ddab05955cf57"
name_prefix    = "vm"
vpc_id    = "vpc-043f9b727b4641"
subnet_id = "subnet-03d133aa96b52"
bucket_name = "pranjal-bucket"
versioning  = true
tags = {
  Project     = "terraform-module"
}
group_name = "example-group"
user_name  = "example-user"
policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
