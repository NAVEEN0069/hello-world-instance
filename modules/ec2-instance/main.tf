resource "aws_instance" "web_ec2" {
  ami                    = var.ami
  instance_type          = var.instance_type
  vpc_security_group_ids = var.vpc_security_group_ids
  subnet_id              = var.subnet_id
  key_name               = var.key_name
  user_data              = var.user_data
  associate_public_ip_address = true

  tags = {
    Name = "hello-world-instance"
    Terraform = "True"
  }
}