# Create a security group for the EC2 instance
resource "aws_security_group" "bastion_sg" {
  vpc_id = aws_vpc.main.id

  // Example rule: Allow SSH access from anywhere
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    }

}



resource "aws_instance" "bastion" {
  ami                    = "ami-0e670eb768a5fc3d4"  # Specify the AMI for your bastion host
  instance_type          = "t2.micro"    # Specify the instance type
  key_name = "dineshkey"
 
  subnet_id= aws_subnet.public_subnet_az1.id  # Use the public subnet in AZ1
  associate_public_ip_address = true
  security_groups = [aws_security_group.bastion_sg.id]
  tags = {
    Name = "bastion-host"
}
}