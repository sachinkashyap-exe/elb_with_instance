resource "aws_ami_from_instance" "my_ami" {
  name               = "myimage"
  source_instance_id = aws_instance.s1.id
   tags = {
    Name = "ami1"
  }
}