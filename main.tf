terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 3.27"
        }
    }

    required_version = ">= 0.14.9"
}

provider "aws" {
    region = "us-west-1"
}

resource "aws_instance" "app_server" {
    ami = "ami-051ed863837a0b1b6"
    instance_type = "t2.micro"
    key_name = "iac-development"
    user_data = <<-EOF
                    #!/bin/bash
                    cd /home/ec2-user
                    echo "<h1> Feito com Terraform</h1>" > index.html
                    nohup busybox httpd -f -p 8080 &    
                   EOF
    tags = {
        Name = "teste_comandos bash"
    }
}