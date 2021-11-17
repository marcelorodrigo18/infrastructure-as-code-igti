# HCL - Hashicorp Configuration Language
# Linguagem declarativa para gerenciamento de configurações

resource "aws_s3_bucket" "datalake" {
  #Parâmetros de configuração dos recursos escolhidos

  # Aqui definimos no nome do nosso bucket
  bucket = "${var.base_bucket_name}-${var.ambiente}-${var.numero_conta}"

  # Acess Control List - Aqui definimos como privado
  acl = "private"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
  tags = {
    IES   = "IGTI"
    CURSO = "EDC"
  }
}
provider "aws" {
  region = "us-east-2"
}