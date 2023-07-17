module "ec2_teleport" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name                        = "ec2-teleport"
  instance_type               = var.ec2_teleport.instance_type
  ami                         = var.ec2_teleport.ami
  key_name                    = "rsa-keypair"
  subnet_id                   = module.vpc.public_subnets[0]
  vpc_security_group_ids      = [module.teleport.security_group_id]
  associate_public_ip_address = true
  private_ip                  = "10.0.101.11"
  user_data = templatefile(var.ec2_teleport.user_data, {
    domain = local.domain,
    email  = var.email,
  })

  tags = {
    Name = "ec2-teleport"
  }
}

module "ec2_node" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name                        = "ec2-node"
  instance_type               = var.ec2_node.instance_type
  ami                         = var.ec2_node.ami
  key_name                    = "rsa-keypair"
  subnet_id                   = module.vpc.public_subnets[0]
  vpc_security_group_ids      = [module.node.security_group_id]
  associate_public_ip_address = true
  private_ip                  = "10.0.101.12"
  user_data = templatefile(var.ec2_node.user_data, {
    domain = local.domain,
    email  = var.email,
  })

  tags = {
    Name = "ec2-node"
  }
}

module "ec2_client" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.0.0"

  name                        = "ec2-client"
  instance_type               = var.ec2_client.instance_type
  ami                         = var.ec2_client.ami
  key_name                    = "rsa-keypair"
  subnet_id                   = module.vpc.public_subnets[0]
  vpc_security_group_ids      = [module.client.security_group_id]
  associate_public_ip_address = true
  private_ip                  = "10.0.101.13"
  user_data                   = file(var.ec2_client.user_data)

  tags = {
    Name = "ec2-client"
  }
}
