output "alb_dns" {
  value = aws_lb.frontend.dns_name
}
