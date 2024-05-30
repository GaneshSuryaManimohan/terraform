locals {
    ami_id = "ami-090252cbe067a9e58"
    #instance_type = "t2.micro"
    instance_type = var.instance_name == "db" ? "t2.micro" : "t3.micro" #Locals can handle expressions as key-value pair and can use wherever needed
    sg_id= "sg-0ccb9d612d9fe866e"
    tags = {
        Name = "DB Instance"
        CreatedBy = "Surya"
    } 
}