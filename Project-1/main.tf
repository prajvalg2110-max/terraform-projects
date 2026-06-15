module "ec2" {
    source = "../modules/ec2"

    ami_id = var.ami_id
    instance_type = var.instance_type
    instance_name = "${terraform.workspace}-server"


    subnet_id = module.subnet.subnet_id
    security_group_id = module.security-group.security_group_id
}

module "vpc" {
    source = "../modules/vpc"

    vpc_cidr = var.vpc_cidr
    vpc_name = "${terraform.workspace}-vpc"
}

module "subnet" {
    source = "../modules/subnet"
    subnet_cidr = var.subnet_cidr
    subnet_name = var.subnet_name
    vpc_id = module.vpc.vpc_id
}

module "security-group" {
    source = "../modules/security-group
    source = "../modules/security-group"

    security_group_name = var.security_group_name
    vpc_id = module.vpc.vpc_id
}
