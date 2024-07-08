variable "region" {
  default = "us-east-1"
}

variable "assume_role" {
  type = object({
    role_arn    = string,
    external_id = string
  })

  default = {
    role_arn    = "<role>"
    external_id = "<ext_id>"
  }
}

variable "tags" {
  type = object({
    Project     = string,
    Environment = string
  })

  default = {
    Project     = "Project XYZ"
    Environment = "Production"
  }
}

variable "s3_bucket" {
  type    = string
  default = "lab-viana-terraform-state-bucket"
}

variable "dynamo_table" {
  type = object({
    name         = string,
    billing_mode = string,
    hash_key     = string,
  })

  default = {
    name         = "lab-terraform-state-lock-table"
    billing_mode = "PAY_PER_REQUEST"
    hash_key     = "LockID"
  }
}
