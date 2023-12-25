variable "region" {
  default = "ap-south-1"
}
variable "project" {
  default = "cloudblitz"
}
variable "vpc_cidr" {
  default = "10.0.0.0/16"
}
variable "private_cidr" {
  default = "10.0.0.0/24"
}
variable "public_cidr" {
  default = "10.0.1.0/24"
}
variable "environment" {
  default = "devops"
}
variable "instance_count" {
  default = "2"
}
variable "image_id" {
  default = "ami-0f5ee92e2d63afc18"
}
variable "key_pair" {
  default = "id_rsa"
}
variable "instance_type" {
  default = "t2.micro"
}
