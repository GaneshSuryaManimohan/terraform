variable "instance_names" {
    type = map
    default = {
        db = "t2.micro"
        backend = "t2.micro"
        frontend = "t3.micro"
    }
}

variable "AMI" {
    type = string
    default = "ami-031d574cddc5bb371"
    description = "RHEL9 for DevOps Practice"
}

variable "common_tags" {
    default = {
        Project = "Expense"
        Environment = "Dev"
        Terraform = "True"
    }
}

#R53 Variables
variable "domain_name" {
    default = "surya-devops.site"
}

variable "zone_id" {
    default = "Z09254361YXRI2M5F61SK"
}