resource "aws_iam_role" "this" {
  name               = local.iam_role_name
  assume_role_policy = local.trust_policy
  tags               = local.default_tags
}

resource "aws_iam_role_policy_attachment" "basic" {
  count      = var.attach_basic_policy ? 1 : 0
  role       = aws_iam_role.this.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

resource "aws_iam_role_policy_attachment" "xray" {
  count      = var.attach_xray_policy ? 1 : 0
  role       = aws_iam_role.this.name
  policy_arn = "arn:aws:iam::aws:policy/AWSXRayDaemonWriteAccess"
}

resource "aws_iam_role_policy_attachment" "custom" {
  for_each   = toset(var.managed_policy_arns)
  role       = aws_iam_role.this.name
  policy_arn = each.value
}

resource "aws_iam_role_policy" "inline" {
  for_each = { for policy in var.inline_policies : policy.name => policy }

  name   = each.key
  role   = aws_iam_role.this.name
  policy = each.value.policy_json
}
