###Tags
variable "env" {
  type        = string
  description = "Enviroment"
}

variable "owner" {
  type        = string
  description = "Owner of resources"
}

### Segurity Groups
variable "ec2_public_key" {
  type        = string
  description = "EC2 Public Key"
}

variable "sec_groups_name" {
  type        = string
  description = "Segurity Groups Name"
}

variable "vpc_id" {
  type        = string
  description = "VPC Id"
}
variable "ec2_webapp_ami" {
  type        = string
  description = "EC2 AMI Id"
}
variable "ec2_instance_type" {
  type        = string
  description = "EC2 Instance Type"
}
### EC2
variable "ec2_quantity" {
  type        = string
  description = "EC2 Instance Type"
}
variable "subnet_1_id" {
  type        = string
  description = "EC2 Instance Type"
}
variable "ec2_webapp_user_data" {
  type        = string
  description = "EC2 Instance Type"
}
variable "ec2_webapp_name" {
  type        = string
  description = "EC2 Instance Type"
}


