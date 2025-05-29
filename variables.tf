# Declaring variables for main

variable "instance_count" {
  description = "Number of EC2 instances to launch"
  type        = number
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "ami_id" {
  description = "AMI ID to use"
  type        = string
}

variable "name_prefix" {
  description = "Prefix for the instance names"
  type        = string
}

variable "vpc_id" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "bucket_name" {
  type        = string
  description = "Name of the S3 bucket"
}

variable "versioning" {
  type        = bool
  description = "Enable versioning on the bucket"
  default     = false
}

variable "tags" {
  type        = map(string)
  description = "Tags for the S3 bucket"
  default     = {}
}

variable "group_name" {
  description = "The name of the IAM group"
  type        = string
}

variable "user_name" {
  description = "The name of the IAM user"
  type        = string
}

variable "policy_arn" {
  description = "The ARN of the IAM policy to attach to the group"
  type        = string
}

