locals {
  common_tags = {
    environment = var.environment_name
    owner       = var.owner_name
    ttl         = var.ttl
  }
}

resource "aws_security_group" "main" {
  name   = var.name
  vpc_id = var.vpc_id

  dynamic "ingress" {
    for_each = var.ingress_rules
    iterator = r
    content {
      protocol         = r.value.protocol
      from_port        = r.value.from_port
      to_port          = r.value.to_port
      cidr_blocks      = r.value.cidr_blocks
      ipv6_cidr_blocks = r.value.ipv6_cidr_blocks
      security_groups  = r.value.security_groups
      prefix_list_ids  = r.value.prefix_list_ids
      self             = r.value.self
    }
  }

  dynamic "egress" {
    for_each = var.egress_rules
    iterator = r
    content {
      protocol         = r.value.protocol
      from_port        = r.value.from_port
      to_port          = r.value.to_port
      cidr_blocks      = r.value.cidr_blocks
      ipv6_cidr_blocks = r.value.ipv6_cidr_blocks
      security_groups  = r.value.security_groups
      prefix_list_ids  = r.value.prefix_list_ids
      self             = r.value.self
    }
  }

  tags = merge(local.common_tags, var.tags == null ? {} : var.tags, { Name = var.name })
}
