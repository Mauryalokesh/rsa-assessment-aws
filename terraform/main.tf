module "vpc" {
  source   = "./modules/vpc"
  vpc_cidr = var.vpc_cidr
}

module "sg" {
  source     = "./modules/sg"
  vpc_id     = module.vpc.vpc_id
  allowed_ip = var.allowed_ip
}

module "frontend_ec2" {
  source    = "./modules/ec2"
  name      = "frontend"
  subnet_id = module.vpc.public_subnet_ids[0]
  sg_id     = module.sg.frontend_sg_id
  ami       = var.ami
}

module "backend_ec2" {
  source    = "./modules/ec2"
  name      = "backend"
  subnet_id = module.vpc.private_subnet_ids[0]
  sg_id     = module.sg.backend_sg_id
  ami       = var.ami
}

module "db_ec2" {
  source    = "./modules/ec2"
  name      = "database"
  subnet_id = module.vpc.private_subnet_ids[1]
  sg_id     = module.sg.db_sg_id
  ami       = var.ami
}


module "alb" {
  source             = "./modules/alb"
  vpc_id             = module.vpc.vpc_id
  public_subnet_ids  = module.vpc.public_subnet_ids
  sg_id              = module.sg.alb_sg_id
  target_instance_id = module.frontend_ec2.instance_id
}

module "hello_world_ec2" {
  source    = "./modules/ec2"
  name      = "hello-world"
  ami       = var.ami
  subnet_id  = module.vpc.public_subnet_ids[1] # this should point to public subnet
  sg_id     = module.sg.hello_sg_id

}

