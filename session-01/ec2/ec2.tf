resource "aws_instance" "web" {
  ami           = "ami-0b4f379183e5706b9"  #devops-practice
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.roboshop-all.id] #this means list
  tags = {
    Name = "HelloTerraform"
  }
}

resource "aws_security_group" "roboshop-all" {  #this is terraform name, for terraform referance only
  name        = var.sg-name #this is for aws 
  description = var.sg-description 
  #vpc_id      = aws_vpc.main.id

  ingress {
    description       = "Allow All ports" 
    from_port         = var.inbound-from-port #0 means all ports
    to_port           = 0 
    protocol          = "tcp"
    cidr_blocks       = var.cidr_blocks
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol     = "-1" # semantically equivalent to all ports
    cidr_blocks     = ["0.0.0.0/0"]     
  }

  tags = {
      Name = "roboshop-all-aws"
  }

}
