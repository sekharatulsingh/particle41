output "load_balancer_dns" {
  value = aws_lb.public.dns_name
}
