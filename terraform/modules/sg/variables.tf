# Add the following
variable "vpc_id" {
  type = string
}

variable "allowed_ip" {
  description = "CIDR block allowed to access the frontend"
  type        = string
}

