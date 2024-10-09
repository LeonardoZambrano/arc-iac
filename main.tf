############# VPC Module #############

module "vpc" {
  source = "./modules/vpc"

  #### Tags ###
  env   = terraform.workspace
  owner = var.owner

  ############ VPC #################

  vpc_cidr = var.vpc_cidr[terraform.workspace]
  vpc_name = var.vpc_name[terraform.workspace]

  ############# Public Subnets #############
  #Subnet 1
  subnet_1_name     = var.subnet_1_name[terraform.workspace]
  subnet_1_cidr     = var.subnet_1_cidr[terraform.workspace]
  subnet_1_ava_zone = var.subnet_1_ava_zone

  #Subnet 2
  subnet_2_name     = var.subnet_2_name[terraform.workspace]
  subnet_2_cidr     = var.subnet_2_cidr[terraform.workspace]
  subnet_2_ava_zone = var.subnet_2_ava_zone

  ############# IG #############
  ig_name = var.ig_name[terraform.workspace]

  ############# Route Table #############
  route_table_name = var.route_table_name[terraform.workspace]
}
