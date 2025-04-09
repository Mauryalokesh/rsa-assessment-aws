variable "vpc_id" {
  description = "VPC ID where bastion will be launched"
  type        = string
}

variable "public_subnet_id" {
  description = "Subnet ID where the bastion host will be placed"
  type        = string
}

variable "ami_id" {
  description = "AMI ID to use for the bastion host"
  type        = string
}

variable "key_name" {
  description = "Key pair name for SSH access"
  type        = string
}

variable "allowed_ip" {
  description = "CIDR block allowed to SSH (e.g., your IP)"
  type        = string
}
