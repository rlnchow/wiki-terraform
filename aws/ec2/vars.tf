# Information about AWS Configs
# variable "AWS_ACCESS_KEY" {}
# variable "AWS_SECRET_KEY" {}
variable "AWS_REGION" {
  default = "us-west-2"
}

variable "AMIS" {
  type = "map"

  default = {
    us-east-1 = "ami-a4dc46db"
    us-west-2 = "ami-db710fa3"
  }
}

variable "LOCATION_PRIVATE_KEY" {
  default = "terraform.key"
}

variable "LOCATION_PUBLIC_KEY" {
  default = "terraform.pub.key"
}

# Information about instance type
variable "INSTANCE_TYPE" {
  default = "t2.micro"
}

variable "INSTANCE_USERNAME" {
  default = "ubuntu"
}
