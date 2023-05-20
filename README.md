# Infraestrutura como código
Definir, implantar, gerenciar e atualizar a infraestrutura como banco de dados, redes e etc. Total controle do ambiente com código.

1. Terraform: Ferramente de alterar, alterar e melhorar de forma apida e visivel
2. Ansible: Automatiza e atualiza apps dentro do servidores. Gerencia ferramentas de de integração contínua.

Script em bash resolveria o gerenciamento da infraestrutura mas a longo prazo é dificil de manter porque esse script depende do ambiente, as convenções de codigo dificultam a manutenção 
e dependem de atualização de cli. Além de ferir o princípio da idempotência, ou seja, ao executar um código várias vezes ele deve retornar o mesmo resultado.

Terraform surge para resolver esses problemas. 
Ele funciona com um script de configuração a partir de sua própria linguagem

## Quais os benefícios?
1.Deploy automatizado e mais rápido e mais seguro sendo mais cnsistencete
2. Controle de versão e ser der problema volta pra versão anterror
3. Velocidade e segurança, executando sempre da mesma forma
4. Reuso: Utilização para outras partes da infra deixando o processo mais ágil

## Instalando o terraform
~~~bash
wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install terraform
~~~


## Instalando o Ansible
~~~bash
sudo apt update
sudo apt install software-properties-common
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt-get install ansible
~~~

## Instalano AWS cli
~~~bash
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
~~~

## Configurando AWS cli
~~~bash
aws configure
output: AWS Access Key ID [None]: 
        AWS Secret Access Key [None]: 
        Default region name [None]: us-east-1
        Default output format [None]: 
~~~

## Montando a infra


~~~javascript
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
    tags = {
        Name = "app_server"
    }
}
~~~

## Iniciando, planejando e construindo a infra

~~~bash
terraform init

terraform plan

terraform apply
~~~

## Associando o recurso ao par de chaves
~~~bash
resource "aws_instance" "app_server" {
    ami = "ami-051ed863837a0b1b6"
    instance_type = "t2.micro"
    key_name = "iac-development"
    tags = {
        Name = "app_server"
    }
}
~~~

## Editando Regras do grupo de segurança para permitir conexão

![Tutorial](https://scribehow.com/embed/How_to_Configure_AWS_Security_Group_Rules__Lfi0_aNWTaeOpu7wM_g_lA)

