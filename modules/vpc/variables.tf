###Tags
variable "env" {
  type        = string
  description = "Enviroment"
}

variable "owner" {
  type        = string
  description = "Owner of resources"

}

#### VPC CIDR Block
variable "vpc_cidr" {
  type        = string
  description = "VPC CIDR"
}

### VPC Name
variable "vpc_name" {
  type        = string
  description = "VPC Name"
}

# Subnet 1
variable "subnet_1_cidr" {
  type        = string
  description = "subnet 1 CIDR"
}

variable "subnet_1_name" {
  type        = string
  description = "subnet 1 Name"
}

variable "subnet_1_ava_zone" {
  type        = string
  description = "Subnet 1 Availability Zone"
}


# Subnet 2
variable "subnet_2_cidr" {
  type        = string
  description = "subnet 2 CIDR"
}

variable "subnet_2_name" {
  type        = string
  description = "subnet 2 Name"
}

variable "subnet_2_ava_zone" {
  type        = string
  description = "Subnet 2 Availability Zone"
}

# Subnet 3
variable "subnet_3_cidr" {
  type        = string
  description = "subnet 3 CIDR"
}

variable "subnet_3_name" {
  type        = string
  description = "subnet 3 Name"
}

variable "subnet_3_ava_zone" {
  type        = string
  description = "Subnet 3 Availability Zone"
}

# Subnet 4
variable "subnet_4_cidr" {
  type        = string
  description = "subnet 4 CIDR"
}

variable "subnet_4_name" {
  type        = string
  description = "subnet 4 Name"
}

variable "subnet_4_ava_zone" {
  type        = string
  description = "Subnet 4 Availability Zone"
}

### Internet Gateway Name
variable "ig_name" {
  type        = string
  description = "IG Name"
}

variable "route_table_name" {
  type        = string
  description = "IG Name"
}
