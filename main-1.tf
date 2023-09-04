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


# variable "cidr_blocks" {
#     description = "cidr block for vpc and subnet"
#     type = list(object({
#         cidr_block = string
#         name = string
#     }))
# }

# resource "aws_vpc" "dev-vpc" {
#     cidr_block = var.cidr_blocks[0].cidr_block
#     tags = {
#         Name: var.cidr_blocks[0].name
#     }
# }

# resource "aws_subnet" "dev-subnet-1" {
#     vpc_id = aws_vpc.dev-vpc.id
#     cidr_block = var.cidr_blocks[1].cidr_block
#     availability_zone = "ap-south-1a"
#     tags = {
#         Name: var.cidr_blocks[1].name
#     }
# }

# data "aws_vpc" "existing_vpc" {
#     default = true
# }

# resource "aws_subnet" "dev-subnet-2" {
#     vpc_id = data.aws_vpc.existing_vpc.id
#     cidr_block = var.cidr_blocks[2].cidr_block
#     availability_zone = "ap-south-1a"
#     tags = {
#         Name: var.cidr_blocks[2].name
#     }
# }
