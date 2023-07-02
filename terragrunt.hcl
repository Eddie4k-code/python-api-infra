terraform {
  source = "https://github.com/Eddie4k-code/python-api-infra"
}

include {
  path = find_in_parent_folders()
}

inputs = {
  region = "us-west-1"
  AWS_ACCESS_KEY = var.AWS_ACCESS_KEY
  AWS_SECRET_KEY = var.AWS_SECRET_KEY
}
