variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "key_name" {
  type        = string
  description = "Name of the existing key pair to use for the EC2 instance"
}

variable "aws_ami" {
  default = "ami-04b4f1a9cf54c11d0"
  description = "EC2 AMI Image ID"
}