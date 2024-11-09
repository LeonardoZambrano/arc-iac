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

  ############# Private Subnets #############
  #Subnet 3
  subnet_3_name     = var.subnet_3_name[terraform.workspace]
  subnet_3_cidr     = var.subnet_3_cidr[terraform.workspace]
  subnet_3_ava_zone = var.subnet_3_ava_zone

  #Subnet 4
  subnet_4_name     = var.subnet_4_name[terraform.workspace]
  subnet_4_cidr     = var.subnet_4_cidr[terraform.workspace]
  subnet_4_ava_zone = var.subnet_4_ava_zone


  ############# IG #############
  ig_name = var.ig_name[terraform.workspace]

  ############# Route Table #############
  route_table_name = var.route_table_name[terraform.workspace]
}
module "ec2" {
  source = "./modules/ec2"

  env   = terraform.workspace
  owner = var.owner

  sec_groups_name = var.sec_groups_name[terraform.workspace]
  vpc_id          = module.vpc.vpc_id
  subnet_1_id     = module.vpc.subnet_1_id

  ec2_webapp_ami       = var.ec2_webapp_ami[terraform.workspace]
  ec2_instance_type    = var.ec2_instance_type[terraform.workspace]
  ec2_public_key       = var.ec2_public_key[terraform.workspace]
  ec2_quantity         = var.ec2_quantity[terraform.workspace]
  ec2_webapp_name      = var.ec2_webapp_name[terraform.workspace]
  ec2_webapp_user_data = var.ec2_webapp_user_data[terraform.workspace]
}
