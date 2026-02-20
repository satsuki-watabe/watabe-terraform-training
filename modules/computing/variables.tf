variable "my_name" {
  description = "tag and prefix resource name"
}

variable "iam_instance_profile" {
  description = "EC2 instance profile"
}

variable "subnet_id" {
  description = "VPC public subnet ID"
}

variable "vpc_security_group_ids" {
  description = "vpc security group IDs"
}
