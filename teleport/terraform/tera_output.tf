output "vm_teleport_ip" {
  value = module.ec2_teleport.public_ip
}

output "vm_node_ip" {
  value = module.ec2_node.public_ip
}

output "vm_client_ip" {
  value = module.ec2_client.public_ip
}

output "domain" {
  value = local.domain
}
