terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.37.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}

resource "aws_instance" "tf-ec2" {
    ami        = var.ec2_ami         
    #ami = "ami-08c40ec9ead489470"
    instance_type = var.ec2_type
    key_name = "firstkey"
    tags = {
      "Name" = "${local.mytag}-come from instance"
    }
}


resource "aws_s3_bucket" "tf-s3" {
  # bucket = "${var.s3_bucket_name}-${count.index}"
  # count = var.num_of_buckets != 0 ? var.num_of_buckets : 3
  #   tags = {
  #   Name = "${local.mytag}-come-from-locals"
  # }
  for_each = toset(var.user)
  bucket = "tf-s3-bucket-abd125-${each.value}"

}

resource "aws_iam_user" "new_user" {
  for_each = toset(var.user)
  name = each.value
}

output "tf-instance-public-ip" {
  value = aws_instance.tf-ec2.public_ip
}

output "tf-s3-bucket-data" {
  value = values(aws_s3_bucket.tf-s3)[*].region
}

output "tf_example_private_ip" {
  value = aws_instance.tf-ec2.private_ip
}

output "s3_bucket_name" {
  value = values(aws_s3_bucket.tf-s3)[*].bucket
}

locals {
  mytag = "abd-local-name"
}
