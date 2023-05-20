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

## Mão na massa:

1. Montando a infra

~~~bash
mkdir terraform-aws-instance

echo "" >> main.tf

echo \
terraform { required_providers {aws = {source = "hashicorp/aws version = "~>3.27"}} required_version=">=0.14.0"}
provider "aws" { profile = "default" region = "us-west-2"}
resource "aws_instance" "app_server_nome_customizado"{ ami = "ami-03dk76" instance_type = "t2.micro" tags = {Name="NomedaInstance"}}

terraform init

terraform plan

terraform apply
~~~

