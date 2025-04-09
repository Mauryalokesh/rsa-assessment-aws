variable "aws_region" {
  description = "AWS Region"
  default     = "eu-west-2"
}

variable "aws_profile" {
  description = "AWS CLI Profile"
  default     = "default"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "ami" {
  description = "AMI ID to launch EC2 instances"
  default     = "ami-05238ab1443fdf48f"
}

# Add this at the bottom
variable "allowed_ip" {
  description = "Your IP in CIDR format"
  type        = string
  default     = "0.0.0.0/0"
}

