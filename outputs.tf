output "instance_public_ip" {
  value = module.ec2_instance.instance_public_ip
}

output "instance_id" {
  value = module.ec2_instance.instance_id
}

output "key_name" {
  value = var.key_name
}