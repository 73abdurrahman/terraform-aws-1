variable "ec2_name" {
  default = "terraform1_ec2"
}

variable "ec2_type" {
  default = "t2.micro"
}

variable "ec2_ami" {
  default = "ami-09d3b3274b6c5d4aa"
}

variable "s3_bucket_name" {
 default = "abd12-tf-test-bucket-tflesson-news"
}

variable "num_of_buckets" {
  default = 2
}

variable "user" {
default = ["santino", "michael", "fredo"]
}