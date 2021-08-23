resource "aws_launch_template" "this" {
  name                   = var.launch_template_name
  description            = "Launch Template for EKS Node Groups"
  update_default_version = true
  #user_data              = base64encode(data.template_file.launch_template_userdata.rendered)

  block_device_mappings {
    device_name = "/dev/xvda"

    ebs {
      volume_size           = var.disk_size
      volume_type           = var.disk_type
      delete_on_termination = true

    }
  }
  ebs_optimized = true
  instance_type = var.instance_type
  key_name      = var.ssh_key_name

  monitoring {
    enabled = true
  }

  network_interfaces {
    associate_public_ip_address = false
    delete_on_termination       = true
    security_groups             = length(var.node_security_groups) > 0 ? var.node_security_groups : [module.node_sg[0].security_group_id]
  }

  lifecycle {
    create_before_destroy = true
  }
}