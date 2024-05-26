variable "instance_names" {
    type = list
    default = ["db", "backend", "frontend"]
}

variable "AMI" {
    type = string
    default = "ami-090252cbe067a9e58"
    description = "RHEL9 for DevOps Practice"
}

variable "instance_type" {
    default = "t2.micro"
    type = string
}

variable "common_tags" {
    default = {
        Project = "Expense"
        Environment = "Dev"
        Terraform = "True"
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