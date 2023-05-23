data "aws_ami" "amzlinux" {
most_recent = true
owners = ["137112412989"]
filter {
name = "name"
values = ["al2023-ami-2023.0.20230503.0-kernel-6.1-x86_64"]
}

filter {
name = "root-device-type"
values = ["ebs"]
}

filter {
name = "virtualization-type"
values = ["hvm"]
}
}