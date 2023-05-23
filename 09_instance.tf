resource "aws_instance" "s1" {
     ami                         = data.aws_ami.amzlinux.id
     key_name                    = aws_key_pair.kp-key.key_name
     instance_type               = "t2.micro"
     subnet_id                   =  aws_subnet.mySubnet.id
     vpc_security_group_ids      = [aws_security_group.allow_tls.id]
     associate_public_ip_address = true
     user_data                   = <<-EOF
     #!/bin/bash
         sudo yum install httpd -y
         sudo systemctl enable httpd
         sudo systemctl start httpd
      echo '<html><h1>Hello From Your first Web Server!</h1></html>' > /var/www/html/index.html
         EOF
         tags = {
     Name = "server1"
         source = "terraform"
                }
    }
    