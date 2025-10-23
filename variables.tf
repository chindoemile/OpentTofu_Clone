variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"  # Change to your region
}

variable "instance_name" {
  description = "Name tag for the new instance"
  type        = string
  default     = "cloned-ec2-instance"
}

variable "ami_id" {
  description = "AMI ID from the existing instance"
  type        = string
  # You'll fill this in after gathering info
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"  # Change to match existing
}

variable "subnet_id" {
  description = "Subnet ID"
  type        = string
  # You'll fill this in after gathering info
}

variable "security_group_ids" {
  description = "List of security group IDs"
  type        = list(string)
  # You'll fill this in after gathering info
}

variable "key_name" {
  description = "EC2 Key Pair name"
  type        = string
  # You'll fill this in after gathering info
}
