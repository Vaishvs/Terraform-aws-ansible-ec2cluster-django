resource "aws_iam_role" "ssm_role" {
  name               = "EC2SSMRole"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_instance_profile" "ssm_profile" {
  name = "EC2SSMProfile"
  role = aws_iam_role.ssm_role.name
}