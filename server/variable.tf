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

variable "ec2_resources" {
  type = object({
    key_pair_name      = string
    instance_profile   = string
    instance_role      = string
    ssh_security_group = string
    ssh_source_ip      = string
  })

  default = {
    key_pair_name      = "lab-production-key-pair"
    instance_profile   = "lab-production-instance-profile"
    instance_role      = "lab-production-instance-role"
    ssh_security_group = "allow_ssh"
    ssh_source_ip      = "177.47.51.13/32"
  }
}

variable "vpc_resources" {
  type = object({
    vpc = string
  })

  default = {
    vpc = "lab-production-vpc"
  }
}

variable "control_plane_launch_template" {
  type = object({
    name                                 = string
    disable_api_stop                     = bool
    disable_api_termination              = bool
    instance_type                        = string
    instance_initiated_shutdown_behavior = string
    ebs = object({
      delete_on_termination = bool
      size                  = number
    })


  })

  default = {
    name                                 = "lab-production-debian-control-plane-lt"
    disable_api_stop                     = true
    disable_api_termination              = true
    instance_type                        = "t3.micro"
    instance_initiated_shutdown_behavior = "terminate"
    ebs = {
      # Depois mudar para false
      delete_on_termination = true
      size                  = 20
    }
  }
}

variable "control_plane_auto_scaling_group" {
  type = object({
    name                      = string
    max_size                  = number
    min_size                  = number
    desired_capacity          = number
    health_check_grace_period = number
    health_check_type         = string
    instance_maintenance_policy = object({
      min_healthy_percentage    = number
      max_healthy_percentage    = number
    })

  })

  default = {
    name                      = "lab-production-control-plane-asg"
    max_size                  = 1
    min_size                  = 1
    desired_capacity          = 1
    health_check_grace_period = 180
    health_check_type         = "EC2"
    instance_maintenance_policy = {
      min_healthy_percentage    = 100
      max_healthy_percentage    = 120
    }

  }
}
