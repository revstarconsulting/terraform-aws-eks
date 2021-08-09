resource "aws_iam_role" "control_plane" {
  name               = var.control_plane_role_name
  description        = "Allows EKS to manage clusters on your behalf."
  assume_role_policy = coalesce(var.control_plane_assume_role_policy, data.aws_iam_policy_document.control_plane_assume_role.json)
  #managed_policy_arns = coalescelist(var.custom_control_plane_role_policies, ["arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"])
  managed_policy_arns = length(var.custom_control_plane_role_policies) > 0 ? var.custom_control_plane_role_policies : null
}

resource "aws_iam_role" "node_group" {
  name               = var.node_group_role_name
  assume_role_policy = coalesce(var.node_group_assume_role_policy, data.aws_iam_policy_document.node_group_assume_role.json)
  #managed_policy_arns = coalescelist(var.custom_node_role_policies, ["arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy",
  #  "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy",
  #"arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"])
  managed_policy_arns = length(var.custom_node_role_policies) > 0 ? var.custom_node_role_policies : null
}


# Cluster policy
resource "aws_iam_role_policy_attachment" "cluster_policy" {
  count      = length(var.custom_control_plane_role_policies) > 0 ? 0 : 1
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.control_plane.name
}

# Node policies
resource "aws_iam_role_policy_attachment" "node_policy" {
  count      = length(var.custom_node_role_policies) > 0 ? 0 : 1
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = aws_iam_role.node_group.name
}

resource "aws_iam_role_policy_attachment" "ecr_policy" {
  count      = length(var.custom_node_role_policies) > 0 ? 0 : 1
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.node_group.name
}

resource "aws_iam_role_policy_attachment" "cni_policy" {
  count      = length(var.custom_node_role_policies) > 0 ? 0 : 1
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = aws_iam_role.node_group.name
}