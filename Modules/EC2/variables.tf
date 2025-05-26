# Declaring variables for ec2 module

variable "instance_count"{
    description = "Number of EC2 to create"
    type = number
}

variable "instance_type" {
  description = "Type of EC2 instance"
  type        = string
  default     = "t2.micro"
}

variable "ami_id" {
  description = "AMI ID to use for the instance"
  type        = string
}

variable "name_prefix" {
  description = "Prefix for the instance names"
  type        = string
}

variable "subnet_id" {
  type = string
}

variable "security_group_ids" {
  type = list(string)
}
