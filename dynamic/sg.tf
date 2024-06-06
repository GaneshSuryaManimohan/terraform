resource "aws_security_group" "allow_ports" {
    name = "allow-ports"
    description = "allowing ports: 22,80,8080,3306"
    #terraform block
    dynamic "ingress" {
        for_each = var.inbound_rules
        content {
            from_port        = ingress.value["port"]
            to_port          = ingress.value["port"]
            protocol         = ingress.value["protocol"]
            cidr_blocks      = ingress.value["allowed_cidr"]
        }
    }
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