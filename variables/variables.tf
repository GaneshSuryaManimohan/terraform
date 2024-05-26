variable "AMI" {
    type = string
    default = "ami-090252cbe067a9e58"
    description = "RHEL9 for DevOps Practice"
}

variable "instance_type" {
    default = "t2.micro"
    type = string
}

variable "tags" {
    default = {
        Project = "Expense"
        Environment = "Dev"
        Module = "DB"
        Name = "Database"
    }
}

variable "sg_name" {
    default = "allow_ssh"
}

variable "sg_description" {
    default = "allowing ssh (port 22)access"
}

variable "ssh_port" {
    default = 22
}

variable "protocol" {
    default = "tcp"
}

variable "allowed_cidr" {
    type = list(string)
    default = ["0.0.0.0/0"]
}