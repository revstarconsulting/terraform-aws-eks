module "cluster_sg" {
  source  = "app.terraform.io/CloudProdigy/security-group/aws"
  version = "1.0.0"

  count                      = length(var.control_plane_security_groups) > 0 ? 0 : 1
  vpc_id                     = var.vpc_id
  security_group_name        = "${var.cluster_name}_eks_cluster_sg"
  security_group_description = "Communication between the control plane and worker nodegroups"
  environment                = var.environment

  ingress_rules_with_cidr_blocks = [{

    cidr_block  = var.vpc_cidr
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    description = "Allow pods to communicate with the cluster API Server"
    }

  ]

  egress_rules_with_cidr_blocks = [
    {
      cidr_block  = "0.0.0.0/0"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      description = "allow all outbound traffic"
    }
  ]

  tag_application = "security-group"
  tag_team        = "IT4I"

  sg_tags = {
    "kubernetes.io/cluster/${var.cluster_name}" = "owned"
  }
}

module "node_sg" {
  source  = "app.terraform.io/CloudProdigy/security-group/aws"
  version = "1.0.0"

  count                      = length(var.node_security_groups) > 0 ? 0 : 1
  vpc_id                     = var.vpc_id
  security_group_name        = "${var.cluster_name}_eks_worker_sg"
  security_group_description = "Communication between all nodes in the cluster"
  environment                = var.environment

  ingress_rules_with_self = [{
    self        = true
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    description = "Allow all managed nodes to communicate with each other"
  }]

  ingress_rules_with_security_group_id = [{
    from_port         = 0
    to_port           = 0
    protocol          = "-1"
    description       = "allow all traffic from master nodes"
    security_group_id = module.cluster_sg[0].security_group_id
  }]

  egress_rules_with_cidr_blocks = [
    {
      cidr_block  = "0.0.0.0/0"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      description = "allow all outbound traffic"
    }
  ]

  tag_application = "security-group"
  tag_team        = "IT4I"

  sg_tags = {
    "kubernetes.io/cluster/${var.cluster_name}" = "owned"
  }
}



