# MVP: Internal Developer Platform (IDP)

## Descrição do Projeto
Este projeto representa um MVP de uma **Internal Developer Platform (IDP)** projetada para simplificar o processo de desenvolvimento e provisionamento de infraestrutura para desenvolvedores. 

O IDP automatiza tarefas comuns, como:
- Build e deploy de um projeto base.
- Provisionamento de infraestrutura na AWS (Lambda, API Gateway).
- Integração contínua e pipelines acionadas manualmente.

## Objetivo do MVP
Facilitar a criação de projetos com:
- Estrutura inicial pré-definida.
- Automação de build, deploy e provisionamento.
- Integração com ferramentas de CI/CD e infraestrutura como código (Terraform).

---

## Estrutura dos Repositórios
O projeto está dividido em dois repositórios:

1. **Repositório Java (Projeto Base):**
   - Local do código fonte da aplicação base.
   - Inclui a configuração do build e integração com S3.

2. **Repositório Terraform (Infraestrutura):**
   - Contém os arquivos Terraform para provisionamento da infraestrutura.
   - Pipeline para gerenciar o provisionamento manualmente.

---

## Guia Rápido

### **1. Clonando os Repositórios**
```bash
# Clone o repositório Java
git clone https://github.com/aggosistemas/project-based-java-idp.git

# Clone o repositório Terraform
git clone https://github.com/aggosistemas/project-based-terraform-idp.git
```

### **2. Pré-requisitos**
- **Ferramentas Necessárias:**
  - Maven
  - AWS CLI
  - Terraform (v1.5.5 ou superior)
  - GitHub CLI (opcional para gerenciar ações)

- **Configuração AWS:**
  - Crie um bucket S3 para armazenar o artefato do build.
  - Configure credenciais AWS:
    ```bash
    aws configure
    ```

### **3. Executando o Build do Projeto Java**
```bash
cd project-based-java-idp
mvn clean package
aws s3 cp target/lambda.zip s3://<bucket-name>/target/lambda.zip
```

### **4. Provisionando a Infraestrutura**
```bash
cd project-based-terraform-idp
terraform init
terraform plan -var="lambda_zip_path=s3://<bucket-name>/target/lambda.zip" -var="project_name=my-project" -var="lambda_name=my-lambda"
terraform apply -auto-approve
```

---

## Fluxo do MVP

### **Pipeline do Projeto Java**
- Executa o build do projeto e faz upload do arquivo `.zip` para o bucket S3.
- Configurada no GitHub Actions para ser acionada manualmente após aprovação de Pull Requests.

### **Pipeline do Terraform**
- Acionada manualmente com opções de `apply` e `destroy`.
- Provisona a infraestrutura na AWS usando o arquivo `.zip` armazenado no S3.

---

## Outputs do Provisionamento
Após o deploy bem-sucedido, os seguintes outputs são gerados:

- **URL do API Gateway:**
  ```
  https://<api-gateway-id>.execute-api.<region>.amazonaws.com/
  ```

- **Nome da Função Lambda:**
  ```
  my-lambda
  ```

---

## Testando o MVP

### **Testando o Endpoint**
Para testar a API, envie uma requisição HTTP `POST` com os parâmetros no corpo da requisição:

```bash
curl -X POST \
-H "Content-Type: application/json" \
-d '{"a":10, "b":20}' \
"https://<api-gateway-id>.execute-api.<region>.amazonaws.com/sum"
```

**Resposta Esperada:**
```json
{
  "result": 30
}
```

---

## Estrutura dos Diretórios

### Repositório Java:
```
/java-project-base
  ├── src/main/java
  ├── pom.xml
  ├── target/
  └── README.md
```

### Repositório Terraform:
```
/terraform
  ├── main.tf
  ├── variables.tf
  ├── outputs.tf
  ├── backend.tf
  └── README.md
```

---

## Melhorias Futuras
- Suporte a múltiplos frameworks e linguagens de programação.
- Provisionamento de ambientes (dev, staging, prod).
- Expansão para monitoramento e logs centralizados.

---

## Licença
Este projeto está licenciado sob os termos da [MIT License](LICENSE).

---

## Contribuidores
- Antonio Oliveira
- Time de Desenvolvimento da Aggosistemas

Se tiver dúvidas ou sugestões, sinta-se à vontade para abrir uma issue em qualquer um dos repositórios!
