# Fetch the default VPC
data "aws_vpc" "default" {
  default = true
}

# Fetch the default subnets in the default VPC
data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

# Use the local Security Group module
module "security_group" {
  source = "./modules/security-group"

  vpc_id = data.aws_vpc.default.id
}

# Use the local EC2 instance module
module "ec2_instance" {
  source = "./modules/ec2-instance"

  ami                    = var.aws_ami
  instance_type          = var.instance_type
  vpc_security_group_ids = [module.security_group.security_group_id]
  subnet_id              = data.aws_subnets.default.ids[0] # Use the first default subnet
  key_name               = var.key_name                    # Use the existing key pair
  user_data              = file("${path.module}/user_data.sh")
}
