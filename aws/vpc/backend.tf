terraform {
  backend "s3" {
    bucket = "terraform-state-f1859"
    key = "terraform-vpc/state_status"
  }
}
