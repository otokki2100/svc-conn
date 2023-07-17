resource "local_file" "ansible_inventory" {
  filename        = "./hosts"
  file_permission = "0600"
  content         = <<-EOT
all:
  hosts:
    ec2_teleport:
      ansible_host: ${module.ec2_teleport.public_ip}
      ansible_connection: ssh
      ansible_user: ${var.ec2_teleport.user}
      ansible_ssh_private_key_file: id_rsa
      ansible_ssh_common_args: "-o StrictHostKeyChecking=no"
    ec2_node:
      ansible_host: ${module.ec2_node.public_ip}
      ansible_connection: ssh
      ansible_user: ${var.ec2_node.user}
      ansible_ssh_private_key_file: id_rsa
      ansible_ssh_common_args: "-o StrictHostKeyChecking=no"
    ec2_client:
      ansible_host: ${module.ec2_client.public_ip}
      ansible_connection: ssh
      ansible_user: ${var.ec2_client.user}
      ansible_ssh_private_key_file: id_rsa
      ansible_ssh_common_args: "-o StrictHostKeyChecking=no"
  EOT
}
