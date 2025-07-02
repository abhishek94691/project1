provider "aws" {
  region = var.region
}

module "vpc" {
  source = "./modules/vpc"
}

module "rds" {
  source = "./modules/rds"
  vpc_id = module.vpc.vpc_id
  ...
}

module "ec2" {
  source = "./modules/ec2"
  db_host = module.rds.db_endpoint
  ...
}

module "alb" {
  source = "./modules/alb"
  ...
}
