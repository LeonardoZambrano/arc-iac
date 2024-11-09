############# Segurity Group #############

resource "aws_key_pair" "public_key" {
  key_name   = var.ec2_public_key   # Nombre que quieres darle a la clave en AWS
  public_key = file("./id_rsa.pub") # Ruta de tu clave pública local
}

resource "aws_security_group" "SGITMKubernetes" {
  name   = var.sec_groups_name
  vpc_id = var.vpc_id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"] # Permite SSH desde cualquier IP. Puedes especificar una IP o rango de IPs.
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name  = var.sec_groups_name,
    env   = var.env,
    owner = var.owner
  }
}

############# EC2 #############

resource "aws_instance" "EC2ITMKubernetes" {
  ami           = var.ec2_webapp_ami    # "ami-063d43db0594b521b" AMI para Amazon Linux 2 en us-east-1 (verifica el AMI de tu región)
  instance_type = var.ec2_instance_type #"t2.micro"         # Tipo de instancia (puedes cambiarlo según tus necesidades)
  key_name      = aws_key_pair.public_key.key_name
  count         = var.ec2_quantity
  subnet_id     = var.subnet_1_id

  security_groups = [aws_security_group.SGITMKubernetes.id]
  user_data       = var.ec2_webapp_user_data
  tags = {
    Name  = var.ec2_webapp_name,
    env   = var.env,
    owner = var.owner
  }
}
