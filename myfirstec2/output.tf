output "publicip" {
  value = "${aws_instance.webserver.public_ip}"
}

output "privateip" {
  value = "${aws_instance.webserver.private_ip}"
}
