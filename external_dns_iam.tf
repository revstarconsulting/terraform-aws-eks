data "aws_iam_policy_document" "external_dns" {
  count = var.external_dns_enabled ? 1 : 0

  statement {
    sid = "ChangeResourceRecordSets"

    actions = [
      "route53:ChangeResourceRecordSets",
    ]

    resources = ["*"]

    effect = "Allow"
  }

  statement {
    sid = "ListResourceRecordSets"

    actions = [
      "route53:ListHostedZones",
      "route53:ListResourceRecordSets",
      "route53:ListTagsForResource",
    ]

    resources = [
      "*",
    ]

    effect = "Allow"
  }
}


resource "aws_iam_policy" "external_dns" {
  count = var.external_dns_enabled ? 1 : 0

  name        = "${var.cluster_name}-external-dns"
  path        = "/"
  description = "Policy for external-dns service"

  policy = data.aws_iam_policy_document.external_dns[0].json
}

# Role
data "aws_iam_policy_document" "external_dns_irsa" {
  count = var.external_dns_enabled ? 1 : 0

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
        "system:serviceaccount:kube-system:external-dns",
      ]
    }

    effect = "Allow"
  }
}

resource "aws_iam_role" "external_dns" {
  count = var.external_dns_enabled ? 1 : 0

  name               = "${var.cluster_name}-external-dns"
  assume_role_policy = data.aws_iam_policy_document.external_dns_irsa[0].json
}

resource "aws_iam_role_policy_attachment" "external_dns" {
  count = var.external_dns_enabled ? 1 : 0

  role       = aws_iam_role.external_dns[0].name
  policy_arn = aws_iam_policy.external_dns[0].arn
}