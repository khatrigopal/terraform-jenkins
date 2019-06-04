provider "aws" {
  region     = "${var.region}"
  access_key = "${var.accesskey}"
  secret_key = "${var.secretkey}"
}


resource "aws_instance" "webserver" {
    tags {
        "Name" = "Webserver"
    }
    ami = "${var.imageid}"
    instance_type = "${var.instancetype}"
    vpc_security_group_ids = "${var.securitygroup}" //subnet group id
    subnet_id = "subnet-0264de1ddd6382637"
    key_name = "${var.key}"
    associate_public_ip_address=true

    connection {
        host = "${aws_instance.webserver.public_ip}"
        type = "ssh"
        user = "ubuntu"
        private_key = "${file("./testing.pem")}"
        timeout = "1m"
        agent = false
    }

        provisioner  "remote-exec" {
            inline = [
                "sudo apt-get update",
                "sudo apt-get install nginx -y",
                "sudo systemctl start nginx",
                //"sudo systemctl nginx restart",
                
            ]
        }      
 
}

//resource "aws_eip" "ins1_eip" {
    //instance = "${aws_instance.webserver.id}"
    //vpc      = true
//}   

