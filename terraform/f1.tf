# terraform {
#   backend "s3" {
#     bucket = "teraform12345"
#     region = "ap-south-1"
#     key = "terraform.tfstate"
#   }
# }

# provider "aws" {
#     region = "ap-south-1"
# }

# resource "aws_instance" "myinstance" {
#   ami = "ami-0d13e3e640877b0b9"
#   instance_type = var.instance_type
#   key_name      = var.key_pair
#   tags          = var.tags
#   vpc_security_group_ids = var.sg_ids

# }

# data "aws_security_groups" "mysg" {
#   filter {
#     name   = "vpc-id"
#     values = [var.vpc_id]
#   }
#   filter {
#     name   = "group-name"
#     values = ["launch-wizard-1"]
#   }
# }

# variable "key_pair" {
#   description = "my key pair"
#   default = "id_rsa"
# }

# variable "instance_type" {
#     description = "enter instance type"
#     default = "t2.micro"
# }