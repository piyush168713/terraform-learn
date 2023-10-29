# # not using explicit subnet association here
# # direct connecting the subnet to the default route table
# # just add a new route to a default route table instead of creating new one
# # l-167

# provider "aws" {
#     region = "ap-south-1"
# }

# variable vpc_cidr_block {}
# variable subnet_cidr_block {}
# variable avail_zone {}
# variable env_prefix {}
# variable my_ip {}

# resource "aws_vpc" "myapp-vpc" {
#     cidr_block = var.vpc_cidr_block
#     tags = {
#         Name: "${var.env_prefix}-vpc"
#     }
# }

# resource "aws_subnet" "myapp-subnet-1" {
#     vpc_id = aws_vpc.myapp-vpc.id
#     cidr_block = var.subnet_cidr_block
#     availability_zone = var.avail_zone
#     tags = {
#         Name: "${var.env_prefix}-subnet-1"
#     }
# }

# /*
# resource "aws_route_table" "myapp-route-table" {
#     vpc_id = aws_vpc.myapp-vpc.id

#     route {
#         cidr_block = "0.0.0.0/0"
#         gateway_id = aws_internet_gateway.myapp-igw.id
#     }
#     tags = {
#         Name: "${var.env_prefix}-rtb"
#     }
# }
# */

# resource "aws_internet_gateway" "myapp-igw" {
#     vpc_id = aws_vpc.myapp-vpc.id
#     tags = {
#         Name: "${var.env_prefix}-igw"
#     }
# }

# resource "aws_default_route_table" "main-rtb" {
#     default_route_table_id = aws_vpc.myapp-vpc.default_route_table_id

#     route {
#         cidr_block = "0.0.0.0/0"
#         gateway_id = aws_internet_gateway.myapp-igw.id
#     }
#     tags = {
#         Name: "${var.env_prefix}-main-rtb"
#     }
# }

# /*
# resource "aws_security_group" "myapp-sg" {
#     name = "myapp-sg"
#     vpc_id = aws_vpc.myapp-vpc.id

#     # incoming traffic - ssh into ec2, access from browser 
#     ingress {
#         from_port = 22
#         to_port = 22
#         protocol = "tcp"
#         cidr_blocks = [var.my_ip]
#     }

#     # anyone can access it by browser
#     ingress {
#         from_port = 8080
#         to_port = 8080
#         protocol = "tcp"
#         cidr_blocks = ["0.0.0.0/0"]
#     }

#     # exiting/outgoing traffic from the server i.e. when docker installed on server then binary needs to be fetched from internet
#     egress {
#         from_port = 0
#         to_port = 0
#         protocol = "-1"
#         cidr_blocks = ["0.0.0.0/0"]
#     }

#     tags = {
#         Name: "${var.env_prefix}-sg"
#     }
# }
# */

# resource "aws_default_security_group" "myapp-sg" {
#     vpc_id = aws_vpc.myapp-vpc.id

#     # incoming traffic - ssh into ec2, access from browser 
#     ingress {
#         from_port = 22
#         to_port = 22
#         protocol = "tcp"
#         cidr_blocks = [var.my_ip]
#     }

#     # anyone can access it by browser
#     ingress {
#         from_port = 8080
#         to_port = 8080
#         protocol = "tcp"
#         cidr_blocks = ["0.0.0.0/0"]
#     }

#     # exiting/outgoing traffic from the server i.e. when docker installed on server then binary needs to be fetched from internet
#     egress {
#         from_port = 0
#         to_port = 0
#         protocol = "-1"
#         cidr_blocks = ["0.0.0.0/0"]
#     }

#     tags = {
#         Name: "${var.env_prefix}-default-sg"
#     }
# }
