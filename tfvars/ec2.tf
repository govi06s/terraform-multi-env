resource "aws_instance" "expense" {
  for_each = var.instances #this variable is map
  #for_each will give a special variable called each
  ami                    = "ami-09c813fb71547fc4f" # This AMI id may change over the time
  instance_type          = each.value
  vpc_security_group_ids = [aws_security_group.allow_ssh_terrform.id]
  tags = merge(
    var.common_tags,
    var.tags,
    {
      Name = each.key
    }
  )
}

resource "aws_security_group" "allow_ssh_terrform" {
  name        = "allow_ssh_${var.environment}" #allow ssh is already there in my account
  description = " allow port number 22 for ssh access"

  #usually we allow everything in egress
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"] #allow from everyone
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = merge(
    var.common_tags,
    var.tags,
    {
      Name = "allow_ssh_${var.environment}"
    }
  )


}