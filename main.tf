############# VPC #############

resource "aws_vpc" "VPCITMKubernetes" {
  cidr_block       = "192.168.13.0/24"
  instance_tenancy = "default"
  tags = {
    Name  = "vpc-itm-lab-tf",
    env   = "lab",
    owner = "olzp"
  }
}

############# Public Subnets #############

resource "aws_subnet" "SUBNETPublic1ITMKubernetes" {
  vpc_id            = aws_vpc.VPCITMKubernetes.id
  cidr_block        = "192.168.13.0/27"
  availability_zone = "us-east-1a"
  depends_on        = [aws_vpc.VPCITMKubernetes]

  tags = {
    Name  = "sn-itm-lab-public-1-tf",
    env   = "lab",
    owner = "olzp"
  }
}

resource "aws_subnet" "SUBNETPublic2ITMKubernetes" {
  vpc_id            = aws_vpc.VPCITMKubernetes.id
  cidr_block        = "192.168.13.32/27"
  availability_zone = "us-east-1d"
  depends_on        = [aws_vpc.VPCITMKubernetes]


  tags = {
    Name  = "sn-itm-lab-public-2-tf",
    env   = "lab",
    owner = "olzp"
  }
}


############# Private Subnets #############

resource "aws_subnet" "SUBNETPrivate1ITMKubernetes" {
  vpc_id            = aws_vpc.VPCITMKubernetes.id
  cidr_block        = "192.168.13.64/27"
  availability_zone = "us-east-1a"
  depends_on        = [aws_vpc.VPCITMKubernetes]


  tags = {
    Name  = "sn-itm-lab-private-1-tf",
    env   = "lab",
    owner = "olzp"
  }
}
resource "aws_subnet" "SUBNETPrivate2ITMKubernetes" {
  vpc_id            = aws_vpc.VPCITMKubernetes.id
  cidr_block        = "192.168.13.96/27"
  availability_zone = "us-east-1d"
  depends_on        = [aws_vpc.VPCITMKubernetes]


  tags = {
    Name  = "sn-itm-lab-private-2-tf",
    env   = "lab",
    owner = "olzp"
  }
}

resource "aws_subnet" "SUBNETPrivate3ITMKubernetes" {
  vpc_id            = aws_vpc.VPCITMKubernetes.id
  cidr_block        = "192.168.13.128/27"
  availability_zone = "us-east-1a"
  depends_on        = [aws_vpc.VPCITMKubernetes]


  tags = {
    Name  = "sn-itm-lab-private-3-tf",
    env   = "lab",
    owner = "olzp"
  }
}
resource "aws_subnet" "SUBNETPrivate4ITMKubernetes" {
  vpc_id            = aws_vpc.VPCITMKubernetes.id
  cidr_block        = "192.168.13.160/27"
  availability_zone = "us-east-1d"
  depends_on        = [aws_vpc.VPCITMKubernetes]


  tags = {
    Name  = "sn-itm-lab-private-4-tf",
    env   = "lab",
    owner = "olzp"
  }
}

resource "aws_internet_gateway" "IGWITMKubernetes" {
  vpc_id = aws_vpc.VPCITMKubernetes.id

  tags = {
    Name  = "ig-itm-lab-tf",
    env   = "lab",
    owner = "olzp"
  }
}

############# Table Routes #############

resource "aws_route_table" "ROUTABITMKubernetes" {
  vpc_id = aws_vpc.VPCITMKubernetes.id

  # since this is exactly the route AWS will create, the route will be adopted
  route {
    cidr_block = "192.168.13.0/24"
    gateway_id = "local"
  }
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.IGWITMKubernetes.id
  }
  tags = {
    Name  = "rt-itm-lab-public-tf",
    env   = "lab",
    owner = "olzp"
  }
  depends_on = [aws_vpc.VPCITMKubernetes, aws_internet_gateway.IGWITMKubernetes]
}

resource "aws_route_table_association" "RTASSOPUB1ITMKubernetes" {
  subnet_id      = aws_subnet.SUBNETPublic1ITMKubernetes.id
  route_table_id = aws_route_table.ROUTABITMKubernetes.id
}

resource "aws_route_table_association" "RTASSOPUB2ITMKubernetes" {
  subnet_id      = aws_subnet.SUBNETPublic2ITMKubernetes.id
  route_table_id = aws_route_table.ROUTABITMKubernetes.id
}


############# Network ACL #############

resource "aws_network_acl" "NACLPUBITMKubernetes" {
  vpc_id = aws_vpc.VPCITMKubernetes.id
  tags = {
    Name  = "nacl-itm-lab-public-tf",
    env   = "lab",
    owner = "olzp"
  }
}
### Ingress rules
resource "aws_network_acl_rule" "NACLRULINTALLINPUBITMKubernetes" {
  network_acl_id = aws_network_acl.NACLPUBITMKubernetes.id
  rule_number    = 100
  egress         = false
  protocol       = "all"
  rule_action    = "allow"
  cidr_block     = "192.168.13.0/24"
}
resource "aws_network_acl_rule" "NACLRULTCPINPUBITMKubernetes" {
  network_acl_id = aws_network_acl.NACLPUBITMKubernetes.id
  rule_number    = 200
  egress         = false
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = 1024
  to_port        = 65535
}
### Egress rules
resource "aws_network_acl_rule" "NACLRULINTALLOUTPUBITMKubernetes" {
  network_acl_id = aws_network_acl.NACLPUBITMKubernetes.id
  rule_number    = 100
  egress         = true
  protocol       = "all"
  rule_action    = "allow"
  cidr_block     = "192.168.13.0/24"
}
resource "aws_network_acl_rule" "NACLRULTCPPUBITMKubernetes" {
  network_acl_id = aws_network_acl.NACLPUBITMKubernetes.id
  rule_number    = 200
  egress         = true
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = 1024
  to_port        = 65535
}
### Assign ACL to Subnet
resource "aws_network_acl_association" "NACLASSPUBSUB1TMKubernetes" {
  subnet_id      = aws_subnet.SUBNETPublic1ITMKubernetes.id
  network_acl_id = aws_network_acl.NACLPUBITMKubernetes.id
}
resource "aws_network_acl_association" "NACLASSPUBSUB2TMKubernetes" {
  subnet_id      = aws_subnet.SUBNETPublic2ITMKubernetes.id
  network_acl_id = aws_network_acl.NACLPUBITMKubernetes.id
}

resource "aws_network_acl" "NACLPRIITMKubernetes" {
  vpc_id = aws_vpc.VPCITMKubernetes.id
  tags = {
    Name  = "nacl-itm-lab-private-tf",
    env   = "lab",
    owner = "olzp"
  }
}
### Ingress rules
resource "aws_network_acl_rule" "NACLRULINTALLINPRIITMKubernetes" {
  network_acl_id = aws_network_acl.NACLPRIITMKubernetes.id
  rule_number    = 100
  egress         = false
  protocol       = "all"
  rule_action    = "allow"
  cidr_block     = "192.168.13.0/24"
}
resource "aws_network_acl_rule" "NACLRULTCPINPRIITMKubernetes" {
  network_acl_id = aws_network_acl.NACLPRIITMKubernetes.id
  rule_number    = 200
  egress         = false
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = 1024
  to_port        = 65535
}
### Egress rules
resource "aws_network_acl_rule" "NACLRULINTALLOUTPRIITMKubernetes" {
  network_acl_id = aws_network_acl.NACLPRIITMKubernetes.id
  rule_number    = 100
  egress         = true
  protocol       = "all"
  rule_action    = "allow"
  cidr_block     = "192.168.13.0/24"
}
resource "aws_network_acl_rule" "NACLRULTCPPRIITMKubernetes" {
  network_acl_id = aws_network_acl.NACLPRIITMKubernetes.id
  rule_number    = 200
  egress         = true
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = 1024
  to_port        = 65535
}
### Assign ACL to Subnet
resource "aws_network_acl_association" "NACLASSPRISUB1TMKubernetes" {
  subnet_id      = aws_subnet.SUBNETPrivate1ITMKubernetes.id
  network_acl_id = aws_network_acl.NACLPRIITMKubernetes.id
}
resource "aws_network_acl_association" "NACLASSPRISUB2TMKubernetes" {
  subnet_id      = aws_subnet.SUBNETPrivate2ITMKubernetes.id
  network_acl_id = aws_network_acl.NACLPRIITMKubernetes.id
}
resource "aws_network_acl_association" "NACLASSPRISUB3TMKubernetes" {
  subnet_id      = aws_subnet.SUBNETPrivate3ITMKubernetes.id
  network_acl_id = aws_network_acl.NACLPRIITMKubernetes.id
}
resource "aws_network_acl_association" "NACLASSPRISUB4TMKubernetes" {
  subnet_id      = aws_subnet.SUBNETPrivate4ITMKubernetes.id
  network_acl_id = aws_network_acl.NACLPRIITMKubernetes.id
}
