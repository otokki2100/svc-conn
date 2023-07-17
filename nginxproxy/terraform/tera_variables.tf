variable "region" {
  description = "AWS region"
  default     = "us-east-1"
}

variable "myip" {
  description = "My IP"
}

variable "ec2_nginxproxy" {
  type = object({
    user          = string
    instance_type = string
    ami           = string
    user_data     = string
  })
}

variable "ec2_client" {
  type = object({
    user          = string
    instance_type = string
    ami           = string
    user_data     = string
  })
}
