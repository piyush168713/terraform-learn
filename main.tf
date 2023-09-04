# variable "access_key_var" {
#     description = "access key"
# }

# variable "secret_key_var" {
#     description = "secret key"
# }

# provider "aws" {
#     region = "ap-south-1"
#     access_key = var.access_key_var
#     secret_key = var.secret_key_var
# }

# variable "subnet_cidr_block_1" {
#     description = "subnet cidr block"
# }

# variable "vpc_cidr_block" {
#     description = "VPC cidr block"
# }

# variable "cidr_blocks" {
#     description = "cidr block for vpc and subnet"
#     type = list(string)
# }

# variable "environment" {
#     description = "deployment environment"
# }

# resource "aws_vpc" "dev-vpc" {
#     # cidr_block = var.vpc_cidr_block
#     cidr_block = var.cidr_blocks[0]
#     tags = {
#         Name: var.environment
#     }
# }

# resource "aws_subnet" "dev-subnet-1" {
#     vpc_id = aws_vpc.dev-vpc.id
#     # cidr_block = var.subnet_cidr_block_1
#     cidr_block = var.cidr_blocks[1]
#     availability_zone = "ap-south-1a"
#     tags = {
#         Name: "subnet-1-dev"
#     }
# }

# data "aws_vpc" "existing_vpc" {
#     default = true
# }

# variable "subnet_cidr_block_2" {
#     description = "subnet cidr block"
# }

# resource "aws_subnet" "dev-subnet-2" {
#     vpc_id = data.aws_vpc.existing_vpc.id
#     # cidr_block = "172.31.48.0/20"
#     # cidr_block = var.subnet_cidr_block_2
#     cidr_block = var.cidr_blocks[2]
#     availability_zone = "ap-south-1a"
# }
