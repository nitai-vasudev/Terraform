resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  tags       = local.common_tags
}

resource "aws_instance" "web_server" {
  ami           = "ami-0c55b159cbfafe1f0" # Amazon Linux 2 (check region)
  instance_type = "t3.micro"
  tags          = merge(local.common_tags, { Name = "${local.project_name}-ec2" })
}