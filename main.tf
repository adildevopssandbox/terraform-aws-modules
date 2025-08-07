module "vpc" {
  source                = "./modules/vpc"
  vpc_name              = var.vpc_name
  subnet_name           = var.subnet_name
  aws_availability_zone = var.aws_availability_zone
}

module "s3" {
  source         = "./modules/s3"
  s3_bucket_name = var.s3_bucket_name
}

module "security_groups" {
  source  = "./modules/security_groups"
  vpc_id  = module.vpc.vpc_id
  cidr_sg = var.cidr_sg
}

module "ec2" {
  source        = "./modules/ec2"
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = module.vpc.subnet_a_id
  instance_name = var.instance_name
}

module "rds" {
  source                = "./modules/rds"
  db_username           = var.db_username
  db_password           = var.db_password
  rds_sg_id             = module.security_groups.rds_sg_id
  subnet_ids            = [module.vpc.subnet_a_id, module.vpc.subnet_b_id]
  rds_subnet_group_name = var.rds_subnet_group_name
}

# __generated__ by Terraform from "aa-test-import-tf"
resource "aws_s3_bucket" "aa-import-bucket" {
  bucket              = "aa-test-import-tf"
  bucket_prefix       = null
  force_destroy       = null
  object_lock_enabled = false
  tags                = {}
  tags_all            = {}
}

#module "ec2" {
# ...
#  key_name = module.keypair.ec2_key_name
#}