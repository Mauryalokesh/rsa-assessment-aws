output "ec2_instance_id" {
  value = module.ec2.instance_id
}

output "alb_dns" {
  value = module.alb.alb_dns
}
