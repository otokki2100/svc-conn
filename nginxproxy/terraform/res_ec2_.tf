module "ec2_nginxproxy" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name                        = "ec2-nginxproxy"
  instance_type               = var.ec2_nginxproxy.instance_type
  ami                         = var.ec2_nginxproxy.ami
  key_name                    = "rsa-keypair"
  subnet_id                   = module.vpc.public_subnets[0]
  vpc_security_group_ids      = [module.nginxproxy.security_group_id]
  associate_public_ip_address = true
  private_ip                  = "10.0.101.11"
  user_data                   = file(var.ec2_nginxproxy.user_data)

  tags = {
    Name = "ec2-nginxproxy"
  }
}

module "ec2_client" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name                        = "ec2-client"
  instance_type               = var.ec2_client.instance_type
  ami                         = var.ec2_client.ami
  key_name                    = "rsa-keypair"
  subnet_id                   = module.vpc.public_subnets[0]
  vpc_security_group_ids      = [module.client.security_group_id]
  associate_public_ip_address = true
  private_ip                  = "10.0.101.12"
  user_data                   = file(var.ec2_client.user_data)

  tags = {
    Name = "ec2-client"
  }
}
