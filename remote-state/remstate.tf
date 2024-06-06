resource "aws_instance" "db" {
        ami = "ami-090252cbe067a9e58"
        instance_type = "t2.micro"
        vpc_security_group_ids = ["sg-0ccb9d612d9fe866e"]
    tags = {
        Name = "DB Instance"
        CreatedBy = "Surya"
    }
}