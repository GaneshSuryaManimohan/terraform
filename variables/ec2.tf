# resource <resource-type>  <resource-name>
resource "aws_security_group" "allow_ssh" {
    name = var.sg_name
    description = var.sg_description
    #ingress = inbound rules
    ingress {
        from_port        = var.ssh_port
        to_port          = var.ssh_port
        protocol         = var.protocol
        cidr_blocks      = var.allowed_cidr
    }
    #egress = outbound rules
    egress {
        from_port        = 0 
        to_port          = 0
        protocol         = "-1" # -1 means allow all protocols
        cidr_blocks      = var.allowed_cidr
    }

    tags = {
        Name = "allow ssh"
        CreatedBy = "Surya" 
    }
}

resource "aws_instance" "db" {
        ami = var.AMI
        instance_type = var.instance_type
        vpc_security_group_ids = [aws_security_group.allow_ssh.id]
    tags = var.tags
}