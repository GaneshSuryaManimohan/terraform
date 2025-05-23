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

resource "aws_instance" "expense" {
        count = length(var.instance_names)
        ami = var.AMI
        instance_type = var.instance_names[count.index] == "db" ? "t2.micro" : "t3.micro"
        vpc_security_group_ids = [aws_security_group.allow_ssh.id]
    tags = merge(
        var.common_tags,
        {
            Name = var.instance_names[count.index]
            Module = var.instance_names[count.index]
        }
    )
}

#route53 

resource "aws_route53_record" "expense" {
  count = length(var.instance_names)
  zone_id = var.zone_id
#   name    = var.instance_names[count.index] == "frontend" ? var.domain_name : "${var.instance_names[count.index]}.${var.domain_name}"
  name = local.record_name
  type    = "A"
  ttl     = 10
#   records =  var.instance_names[count.index] == "frontend" ? [aws_instance.expense[count.index].public_ip] : [aws_instance.expense[count.index].private_ip]
  records = local.record_value
  allow_overwrite = true #if R53 records already exists this will overwrite the records
}