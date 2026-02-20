resource "aws_iam_role" "webserver" {
  assume_role_policy = <<EOT
{
  "Version":"2012-10-17",
  "Statement":[
    {
      "Effect":"Allow",
      "Principal":{
        "Service":"ec2.amazonaws.com"
      },
      "Action":"sts:AssumeRole"
    }
  ]
}
EOT
  tags = {
    Name = "${var.my_name}-webseerver-role"
  }
}

data "aws_iam_policy" "systems_manager" {
  arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

resource "aws_iam_role_policy_attachment" "websrver" {
  policy_arn = data.aws_iam_policy.systems_manager.id
  role       = aws_iam_role.webserver.id
}

resource "aws_iam_instance_profile" "webserver" {
  role = aws_iam_role.webserver.id
}
