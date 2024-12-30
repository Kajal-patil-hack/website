# Creating key-pair on AWS using SSH-public key
resource "aws_key_pair" "deployer" {
  key_name   = var.key-name
  public_key = file("${path.module}/my-key.pub")
}

# Creating a security group to restrict/allow inbound connectivity
resource "aws_security_group" "network-security-group" {
  name        = var.network-security-group-name
  description = "Allow TLS inbound traffic"

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] 
  }
  # Not recommended to add "0.0.0.0/0" instead we need to be more specific with the IP ranges to allow connectivity from.
  tags = {
    Name = "nsg-inbound"
  }
}


# Creating Ubuntu EC2 instance
६resource "aws_instance" "example_server" {
  ami             = "ami-03c68e52484d7488f"
  instance_type   = "t2.micro"
  tags = {
    Name = "web1"
  }
}

# Creating Ubuntu EC2 instance
६resource "aws_instance" "example_server" {
  ami             = "ami-03c68e52484d7488f"
  instance_type   = "t2.micro"
  tags = {
    Name = "web1"
  }
}
