resource "aws_instance" "expense" {
        for_each = var.instance_names
        ami = var.AMI
        instance_type = each.value
        vpc_security_group_ids = ["sg-0b097264b60ff50ed"]
    tags = merge(
        var.common_tags,
        {
            Name = each.key
            Module = each.key
        }
    )
}