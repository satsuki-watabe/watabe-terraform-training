module "security" {
  source  = "../../modules/security"
  my_name = var.my_name
}

module "network" {
  source  = "../../modules/network/"
  my_name = var.my_name
}

module "computing" {
  source                 = "../../modules/computing"
  iam_instance_profile   = module.security.aws_iam_instance_profile
  subnet_id              = module.network.aws_public_subnet
  vpc_security_group_ids = module.network.aws_ec2_access_allow_ip
  my_name                = var.my_name
}
