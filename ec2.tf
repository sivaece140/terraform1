#resource "aws_instance" "example1" {
#  ami           = data.aws_ami.latest_amazon_linux.id   # Replace with your desired AMI ID
#  instance_type = var.instance_type
#  subnet_id     = data.aws_subnet.selected.id    # Replace with your desired subnet ID
#  key_name      = aws_key_pair.student.key_name          # Replace with your desired key pair name

#  tags = {
#    "Name" = format("MyInstance-%s", formatdate("YYYYMMDD", timestamp()))
#  }
#}
locals {
  instance_ami         = data.aws_ami.latest_amazon_linux.id
  instance_subnet      = data.aws_subnet.selected.id
  instance_key_pair    = aws_key_pair.student25.key_name
  instance_tags        = {
    "Name" = format("Siva25-%s", formatdate("YYYYMMDD", timestamp()))
  }
}

resource "aws_instance" "example" {
  ami           = local.instance_ami
  instance_type = var.instance_type
  subnet_id     = local.instance_subnet
  key_name      = local.instance_key_pair

  tags = local.instance_tags
  # Specify dependencies explicitly using depends_on if needed
  depends_on = [
    aws_key_pair.student25,
    data.aws_subnet.selected,
    data.aws_ami.latest_amazon_linux,
  ]
}
