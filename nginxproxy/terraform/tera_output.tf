output "nginxproxy_ip" {
  value = module.ec2_nginxproxy.public_ip
}

output "client_ip" {
  value = module.ec2_client.public_ip
}
