resource "aws_launch_configuration" "my_launch_config" {
  name_prefix                 = "my_lc1"
  image_id                    = aws_ami_from_instance.my_ami.id
  instance_type               = "t2.micro"  
  associate_public_ip_address = true
  security_groups             = [aws_security_group.allow_tls.id]
  key_name                    = aws_key_pair.kp-key.key_name
  
  lifecycle {
    create_before_destroy = true
  }
}
