data "aws_iam_policy_document" "app" {
  statement {
    actions = [
      "s3:*",
      "cognito-idp:*"
    ]

    resources = ["*"]

    effect = "Allow"
  }
}


resource "aws_iam_policy" "app" {
  name        = "${var.cluster_name}-${var.tag_application}-policy"
  path        = "/"
  description = "Policy for application pods"

  policy = data.aws_iam_policy_document.app.json
}

# Role
data "aws_iam_policy_document" "app_irsa" {
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
        "system:serviceaccount:${var.app_namespace}:${var.app_service_account}",
      ]
    }

    effect = "Allow"
  }
}

resource "aws_iam_role" "app" {
  name               = "${var.cluster_name}-${var.tag_application}-role"
  assume_role_policy = data.aws_iam_policy_document.app_irsa.json
}

resource "aws_iam_role_policy_attachment" "app" {

  role       = aws_iam_role.app.name
  policy_arn = aws_iam_policy.app.arn
}