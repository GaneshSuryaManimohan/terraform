variable "AMI" {
    type = string
    default = "ami-090252cbe067a9e58"
    description = "RHEL9 for DevOps Practice"
}

variable "instance_type" {
    default = "t2.micro"
    type = string
}

variable "instance_name" {
    default = "db"
}
