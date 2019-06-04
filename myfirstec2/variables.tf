variable "region" {
  default = "us-west-2"
}

variable "accesskey" {
  type = "string"
}

variable "secretkey" {
  type = "string"
}

variable "imageid" {
  default = "ami-005bdb005fb00e791"
}

variable "key" {
  default = "testing"
}

variable "instancetype" {
  default = "t2.micro"
}

variable "securitygroup" {
  default = ["sg-05289978ac69c1a9c"]
}




