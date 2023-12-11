resource "aws_key_pair" "student25" {
  key_name   = "training-25"
  public_key = file("~/awslabs/training.125-vm-key.pub")  # Path to your public key file
}
