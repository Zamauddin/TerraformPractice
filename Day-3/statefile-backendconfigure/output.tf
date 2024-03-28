output "public_ip" {
value = aws_instance.coolname.public_ip
  sensitive = true
}

output "private_ip" {
    value = aws_instance.coolname.private_ip
    sensitive = false
  
}