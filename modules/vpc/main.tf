resource "aws_vpc" "main" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"
  tags = merge({
    Name        = var.vpc_name,
    environment = var.environment,
    owner       = var.owner,
    cost_center = var.cost_center
  }, var.extra_tags)
}

resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet_cidr
  map_public_ip_on_launch = true
  availability_zone       = var.public_az
  tags = merge({
    Name        = var.public_subnet_name,
    environment = var.environment,
    owner       = var.owner,
    cost_center = var.cost_center
  }, var.extra_tags)
}

resource "aws_subnet" "private" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnet_cidr
  availability_zone = var.private_az
  tags = merge({
    Name        = var.private_subnet_name,
    environment = var.environment,
    owner       = var.owner,
    cost_center = var.cost_center
  }, var.extra_tags)
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id
  tags = merge({
    Name        = var.igw_name,
    environment = var.environment,
    owner       = var.owner,
    cost_center = var.cost_center
  }, var.extra_tags)
}

resource "aws_route_table" "rtb" {
  vpc_id = aws_vpc.main.id
  tags = merge({
    Name        = var.route_table_name,
    environment = var.environment,
    owner       = var.owner,
    cost_center = var.cost_center
  }, var.extra_tags)
}

resource "aws_route" "r" {
  route_table_id         = aws_route_table.rtb.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.gw.id
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.rtb.id
}
