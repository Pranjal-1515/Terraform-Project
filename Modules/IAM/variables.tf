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
