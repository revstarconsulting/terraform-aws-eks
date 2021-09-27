data "aws_iam_policy_document" "fluentd" {
  count = var.app_logs_enabled ? 1 : 0

  statement {

    actions = [
      "logs:CreateLogStream",
      "logs:DescribeLogGroups",
      "logs:DescribeLogStreams",
      "logs:CreateLogGroup",
      "logs:PutLogEvents"
    ]

    resources = ["*"]

    effect = "Allow"
  }
}


resource "aws_iam_policy" "fluentd" {
  count = var.app_logs_enabled ? 1 : 0

  name        = "${var.cluster_name}-fluentd"
  path        = "/"
  description = "Policy for cloudwatch logs using fluentd"

  policy = data.aws_iam_policy_document.fluentd[0].json
}

# Role
data "aws_iam_policy_document" "fluentd_irsa" {
  count = var.app_logs_enabled ? 1 : 0

  statement {
    actions = ["sts:AssumeRoleWithWebIdentity"]

    principals {
      type        = "Federated"
      identifiers = [aws_iam_openid_connect_provider.this[0].arn]
    }

    condition {
      test     = "StringEquals"
      variable = "${replace(aws_eks_cluster.this.identity[0].oidc[0].issuer, "https://", "")}:sub"

      values = [
        "system:serviceaccount:amazon-cloudwatch:fluentd",
      ]
    }

    effect = "Allow"
  }
}

resource "aws_iam_role" "fluentd" {
  count = var.app_logs_enabled ? 1 : 0

  name               = "${var.cluster_name}-external-dns"
  assume_role_policy = data.aws_iam_policy_document.fluentd_irsa[0].json
}

resource "aws_iam_role_policy_attachment" "fluentd" {
  count = var.app_logs_enabled ? 1 : 0

  role       = aws_iam_role.fluentd[0].name
  policy_arn = aws_iam_policy.fluentd[0].arn
}