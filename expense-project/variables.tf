#EC2 Variables
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

#Security Group Variables

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

#R53 Variables
variable "domain_name" {
    default = "surya-devops.site"
}

variable "zone_id" {
    default = "Z09254361YXRI2M5F61SK"
}