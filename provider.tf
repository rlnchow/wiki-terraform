provider "aws" {
  # Configure AWS CLI on machine
  #    access_key = "${var.AWS_ACCESS_KEY}"
  #    secret_key = "${var.AWS_SECRET_KEY}"
  region = "${var.AWS_REGION}"
}
