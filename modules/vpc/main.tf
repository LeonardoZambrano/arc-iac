############# VPC #############

resource "aws_vpc" "VPCITMKubernetes" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"
  tags = {
    Name  = var.vpc_name,
    env   = var.env,
    owner = var.owner
  }
}
############# Public Subnets #############

resource "aws_subnet" "SUBNETPublic1ITMKubernetes" {
  vpc_id                  = aws_vpc.VPCITMKubernetes.id
  cidr_block              = var.subnet_1_cidr
  availability_zone       = var.subnet_1_ava_zone
  map_public_ip_on_launch = true
  depends_on              = [aws_vpc.VPCITMKubernetes]

  tags = {
    Name  = var.subnet_1_name,
    env   = var.env,
    owner = var.owner
  }
}

resource "aws_subnet" "SUBNETPublic2ITMKubernetes" {
  vpc_id                  = aws_vpc.VPCITMKubernetes.id
  cidr_block              = var.subnet_2_cidr
  availability_zone       = var.subnet_2_ava_zone
  map_public_ip_on_launch = true
  depends_on              = [aws_vpc.VPCITMKubernetes]


  tags = {
    Name  = var.subnet_2_name,
    env   = var.env,
    owner = var.owner
  }
}

############# Private Subnets #############

resource "aws_subnet" "SUBNETPrivate1ITMKubernetes" {
  vpc_id            = aws_vpc.VPCITMKubernetes.id
  cidr_block        = var.subnet_3_cidr
  availability_zone = var.subnet_1_ava_zone
  depends_on        = [aws_vpc.VPCITMKubernetes]


  tags = {
    Name  = var.subnet_3_name,
    env   = var.env,
    owner = var.owner
  }
}
resource "aws_subnet" "SUBNETPrivate2ITMKubernetes" {
  vpc_id            = aws_vpc.VPCITMKubernetes.id
  cidr_block        = var.subnet_4_cidr
  availability_zone = var.subnet_2_ava_zone
  depends_on        = [aws_vpc.VPCITMKubernetes]


  tags = {
    Name  = var.subnet_4_name,
    env   = var.env,
    owner = var.owner
  }
}

############# Internet Gateway #############

resource "aws_internet_gateway" "IGWITMKubernetes" {
  vpc_id = aws_vpc.VPCITMKubernetes.id

  tags = {
    Name  = var.ig_name,
    env   = var.env,
    owner = var.owner
  }
}

############# Route Table #############

resource "aws_route_table" "ROUTABITMKubernetes" {
  vpc_id = aws_vpc.VPCITMKubernetes.id

  # since this is exactly the route AWS will create, the route will be adopted
  route {
    cidr_block = var.vpc_cidr
    gateway_id = "local"
  }
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.IGWITMKubernetes.id
  }
  tags = {
    Name  = var.route_table_name,
    env   = var.env,
    owner = var.owner
  }
  depends_on = [aws_vpc.VPCITMKubernetes, aws_internet_gateway.IGWITMKubernetes]
}


resource "aws_route_table_association" "RTASSOPUB1ITMKubernetes" {
  route_table_id = aws_route_table.ROUTABITMKubernetes.id
  subnet_id      = aws_subnet.SUBNETPublic1ITMKubernetes.id
}

resource "aws_route_table_association" "RTASSOPUB2ITMKubernetes" {
  route_table_id = aws_route_table.ROUTABITMKubernetes.id
  subnet_id      = aws_subnet.SUBNETPublic2ITMKubernetes.id
}
