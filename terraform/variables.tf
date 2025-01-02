variable "aws_region" {
  description = "AWS region for resources"
  default     = "ca-central-1"
}

variable "lambda_zip_path" {
  description = "Path to the Lambda ZIP file in S3"
  default     = "s3://bucket-idpd-toinho/target/lambda.zip"
  #default = "/home/antonio/projetos/lambda.zip"
}


variable "project_name" {
  description = "Nome do projeto"
  default = "my-project-one"
}

variable "lambda_name" {
  description = "Nome da Lambda"
  default = "my-second-lambda"
}

variable "lambda_memory" {
  description = "Memory size for the Lambda function"
  default     = 128
}

variable "lambda_timeout" {
  description = "Timeout for the Lambda function"
  default     = 10
}
