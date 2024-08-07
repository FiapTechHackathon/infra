variable "NOME_REPOSITORIO" {
  type = string
}

variable "CLUSTER_NAME" {
  type = string
}

variable "REGION" {
  type = string
  default = "us-east-1"
}

variable "RDS_CLUSTER_HACKATHON" {
  type = string
}

variable "DB_DATABASE" {
  type = string
}

variable "DB_USERNAME" {
  type = string
}

variable "DB_PASSWORD" {
  type = string
}

variable "DB_PORT" {
  type = string
}

variable "BUCKET" {
  type = string
}
