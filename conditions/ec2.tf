resource "aws_instance" "db" {
        ami = var.AMI
        instance_type = var.instance_name == "db" ? "t2.micro" : "t3.micro"
}