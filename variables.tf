
#Tags
variable "owner" {
  type    = string
  default = "olzp"

}
# VPC
variable "vpc_cidr" {
  type = map(string)
  default = {
    "default" = "192.168.13.0/24"
    "dev"     = "192.168.14.0/24"
  }
}

variable "vpc_name" {
  type = map(string)
  default = {
    "default" = "vpc-itm-lab-tf"
    "dev"     = "vpc-itm-dev-tf"
  }
}
#subnet 1
variable "subnet_1_cidr" {
  type = map(string)
  default = {
    "default" = "192.168.13.0/27"
    "dev"     = "192.168.14.0/27"
  }
}
variable "subnet_1_name" {
  type = map(string)
  default = {
    "default" = "sn-itm-lab-public-1-tf"
    "dev"     = "sn-itm-dev-public-1-tf"
  }
}
variable "subnet_1_ava_zone" {
  type    = string
  default = "us-east-1a"
}

#subnet 2
variable "subnet_2_cidr" {
  type = map(string)
  default = {
    "default" = "192.168.13.32/27"
    "dev"     = "192.168.14.32/27"
  }
}
variable "subnet_2_name" {
  type = map(string)
  default = {
    "default" = "sn-itm-lab-public-2-tf"
    "dev"     = "sn-itm-dev-public-2-tf"
  }
}
variable "subnet_2_ava_zone" {
  type    = string
  default = "us-east-1d"
}

variable "ig_name" {
  type = map(string)
  default = {
    "default" = "ig-itm-lab-tf"
    "dev"     = "ig-itm-dev-tf"
  }
}

variable "route_table_name" {
  type = map(string)
  default = {
    "default" = "rt-itm-lab-public-tf"
    "dev"     = "rt-itm-dev-public-tf"
  }

}
