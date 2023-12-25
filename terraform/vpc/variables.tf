# variable "region" {
#     default = "ap-south-1"
# }
# variable "vpc-cidr" {
#   default = "10.0.0.0/16"
# }
# variable "pvt-cidr" {
#   default = "10.0.0.0/24"
# }
# variable "pub-cidr" {
#   default = "10.0.1.0/24"
# }
# variable "pvt-az"{
#     default = "ap-south-1a"
# }
# variable "pub-az"{
#     default = "ap-south-1b"
# }
# variable "project" {
#   default = "cloud"
# }
# variable "instance_type" {
#     description = "enter instance type"
#     default = "t2.micro"
# }
# variable "ami" {
#   default = "ami-0763cf792771fe1bd"
# }
# variable "key_pair" {
#   default = "id_rsa"
# }
# variable "pvt-tags" {
#   type = map
#   default = {
#     name = "pvt-instance"
#     env = "terraform-practice"
#   }
# }
# variable "pub-tags" {
#   type = map
#   default = {
#     name = "pub-instance"
#     env = "terraform-practice"
#   }
# }
