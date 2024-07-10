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

variable "public_subnets" {
  type = list(object({
    name                    = string
    cidr_block              = string
    availability_zone       = string
    map_public_ip_on_launch = bool
  }))

  default = [{
    name                    = "public-subnet-1a"
    cidr_block              = "10.0.0.0/27"
    availability_zone       = "us-east-1a"
    map_public_ip_on_launch = true
    },
    {
      name                    = "public-subnet-1b"
      cidr_block              = "10.0.0.64/27"
      availability_zone       = "us-east-1b"
      map_public_ip_on_launch = true
  }]
}

variable "private_subnets" {
  type = list(object({
    name                    = string
    cidr_block              = string
    availability_zone       = string
    map_public_ip_on_launch = bool
  }))

  default = [{
    name                    = "private-subnet-1a"
    cidr_block              = "10.0.0.32/27"
    availability_zone       = "us-east-1a"
    map_public_ip_on_launch = false
    },
    {
      name                    = "private-subnet-1b"
      cidr_block              = "10.0.0.96/27"
      availability_zone       = "us-east-1b"
      map_public_ip_on_launch = false
  }]
}

# variable "s3_bucket" {
#   type    = string
#   default = "lab-viana-terraform-state-bucket"
# }

# variable "dynamo_db" {
#   type = object({
#     name         = string,
#     billing_mode = string,
#     hash_key     = string,
#   })

#   default = {
#     name         = "lab-terraform-state-lock-table"
#     billing_mode = "PAY_PER_REQUEST"
#     hash_key     = "LockID"
#   }
# }

variable "vpc_resources" {
  type = object({
    vpc                       = string,
    vpc_cidr_block            = string,
    elastic_ip_nat_gateway_1a = string,
    elastic_ip_nat_gateway_1b = string,
    internet_gateway          = string,
    nat_gateway_1a            = string,
    nat_gateway_1b            = string,
    private_route_table_1a    = string,
    private_route_table_1b    = string,
    public_route_table        = string,
  })

  default = {
    vpc                       = "lab-production-vpc"
    vpc_cidr_block            = "10.0.0.0/24"
    elastic_ip_nat_gateway_1a = "eip-nat-gateway-1a"
    elastic_ip_nat_gateway_1b = "eip-nat-gateway-1b"
    internet_gateway          = "internet-gateway"
    nat_gateway_1a            = "nat-gateway-1a"
    nat_gateway_1b            = "nat-gateway-1b"
    public_route_table        = "public-route-table"
    private_route_table_1a    = "private-route-table-1a"
    private_route_table_1b    = "private-route-table-1b"
  }
}
