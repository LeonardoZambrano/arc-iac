
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

#subnet 3
variable "subnet_3_cidr" {
  type = map(string)
  default = {
    "default" = "192.168.13.64/27"
    "dev"     = "192.168.14.64/27"
  }
}
variable "subnet_3_name" {
  type = map(string)
  default = {
    "default" = "sn-itm-lab-private-3-tf"
    "dev"     = "sn-itm-dev-private-3-tf"
  }
}
variable "subnet_3_ava_zone" {
  type    = string
  default = "us-east-1a"
}

#subnet 4
variable "subnet_4_cidr" {
  type = map(string)
  default = {
    "default" = "192.168.13.96/27"
    "dev"     = "192.168.14.96/27"
  }
}
variable "subnet_4_name" {
  type = map(string)
  default = {
    "default" = "sn-itm-lab-private-4-tf"
    "dev"     = "sn-itm-dev-private-4-tf"
  }
}
variable "subnet_4_ava_zone" {
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

#####EC2 y SG

variable "ec2_public_key" {
  type = map(string)
  default = {
    "default" = "my_key_lab"
    "dev"     = "my_key_dev"
  }
}

variable "sec_groups_name" {
  type = map(string)
  default = {
    "default" = "sec-groups-itm-lab-tf"
    "dev"     = "sec-groups-itm-dev-tf"
  }
}

variable "ec2_webapp_ami" {
  type = map(string)
  default = {
    "default" = "ami-063d43db0594b521b"
    "dev"     = "ami-063d43db0594b521b"
  }
}

variable "ec2_instance_type" {
  type = map(string)
  default = {
    "default" = "t2.micro"
    "dev"     = "t2.micro"
  }
}

variable "ec2_quantity" {
  type = map(string)
  default = {
    "default" = "1"
    "dev"     = "1"
  }
}

variable "ec2_webapp_name" {
  type = map(string)
  default = {
    "default" = "my_web_app_ec2_lab"
    "dev"     = "my_web_app_ec2_dev"
  }
}

variable "ec2_webapp_user_data" {
  type = map(string)
  default = {
    "default" = <<EOF
#!/bin/bash
yum update -y
amazon-linux-extras install mariadb10.5
amazon-linux-extras install php8.2
yum install -y httpd
systemctl start httpd
systemctl enable httpd
EOF
    "dev"     = <<EOF
#!/bin/bash
yum update -y
amazon-linux-extras install mariadb10.5
amazon-linux-extras install php8.2
yum install -y httpd
systemctl start httpd
systemctl enable httpd
EOF
  }

}
