output "vpc_id" {
  value = module.vpc.vpc_id
}

output "alb_dns_name" {
  value = module.alb.alb_dns_name
}

output "db_instance_ip" {
  value = module.db_ec2.public_ip
}
