provider "aws" {
 region = "us-east-1"
}

resource "aws_instance" "devops_server" {
 ami           = "ami-02dfbd4ff395f2a1b"
 instance_type = "t3.micro"
 key_name      = "my-key"

 tags = {
   Name = "DevOps-Lab-Server"
 }
}