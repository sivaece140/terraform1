data "aws_vpc" "selected" {
  id = "vpc-0689c57c5d64be880"
}
data "aws_subnet" "selected" {
  id = "subnet-006d36cc4b4840b09"
}
output "selected_vpc_details" {
  value = {
    id          = data.aws_vpc.selected.id
    cidr_block  = data.aws_vpc.selected.cidr_block
    subnet = data.aws_subnet.selected.id
    # Add more attributes as needed
  }
}
