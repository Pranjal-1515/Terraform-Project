resource "aws_iam_group" "this" {
  name = var.group_name
}

resource "aws_iam_user" "this" {
  name = var.user_name
}

resource "aws_iam_user_group_membership" "this" {
  user = aws_iam_user.this.name
  groups = [aws_iam_group.this.name]
}

resource "aws_iam_group_policy_attachment" "this" {
  group      = aws_iam_group.this.name
  policy_arn = var.policy_arn
}
