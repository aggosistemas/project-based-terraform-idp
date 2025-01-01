
output "lambda_function_name" {
  value = aws_lambda_function.lambda.function_name
}

output "api_gateway_url" {
  value = aws_apigatewayv2_api.api_gateway.api_endpoint
}