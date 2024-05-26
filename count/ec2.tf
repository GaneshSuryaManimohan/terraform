resource "aws_instance" "db" {
        count = 3
        ami = "ami-090252cbe067a9e58"
        vpc_security_group_ids = [aws_security_group.allow_ssh.id]
        instance_type = "t2.micro"
    tags = {
        Name = var.instance_names[count.index]
        CreatedBy = "Surya"
    }
}

resource "aws_security_group" "allow_ssh" {
    name = "allow-ssh"
    description = "allowing ssh access"
    #ingress = inbound rules
    ingress {
        from_port        = 22
        to_port          = 22
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
    }
    #egress = outbound rules
    egress {
        from_port        = 0 
        to_port          = 0
        protocol         = "-1" # -1 means allow all protocols
        cidr_blocks      = ["0.0.0.0/0"]
    }

    tags = {
        Name = "allow ssh"
        CreatedBy = "Surya" 
    }
}