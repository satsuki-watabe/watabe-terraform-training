resource "aws_instance" "webserver" {
  ami           = "ami-0e5b755eb72aa63d9"
  instance_type = "t2.micro"
  subnet_id     = var.subnet_id

  user_data = <<EOT
#!/bin/bash
cd /tmp
sudo dnf install -y https://s3.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/linux_amd64/amazon-ssm-agent.rpm
sudo systemctl enable amazon-ssm-agent
sudo systemctl start amazon-ssm-agent

dnf -y update
dnf -y install httpd

systemectl enable httpd.service
systemctl start hyypd.service
EOT

  iam_instance_profile = var.iam_instance_profile

  vpc_security_group_ids = [
    var.vpc_security_group_ids
  ]
  tags = {
    Name = "${var.my_name}-webserver"
  }
}

resource "aws_eip" "eip" {
  instance = aws_instance.webserver.id
  domain   = "vpc"

  tags = {
    Name = "${var.my_name}-eip"
  }
}
