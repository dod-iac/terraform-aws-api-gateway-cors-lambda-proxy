/*
 * # Terraform AWS API Gateway CORS Lambda Proxy
 *
 * ## Description
 *
 * A Terraform module to create a Cross-Origin Resource Sharing (CORS) Lambda Proxy.
 *
 * Orignal code forked from [squidfunk/terraform-aws-api-gateway-enable-cors](https://github.com/squidfunk/terraform-aws-api-gateway-enable-cors)
 *
 * ## Usage
 *
 * ``` hcl
 * module "cors_lambda" {
 *   source = "dod-iac/api-gateway-cors-lambda-proxy/aws"
 *   version = "1.0.0"
 *
 *   api_id            = aws_api_gateway_rest_api.main_api.id
 *   api_resource_id   = aws_api_gateway_resource.main_api_streams_resource.id
 *   http_method       = "GET"
 *   invoke_arn        = aws_lambda_function.stream_lambda.invoke_arn
 *   invoke_policy_arn = aws_iam_role.api_role.arn
 *   allow_methods = [
 *     "OPTIONS",
 *     "GET"
 *   ]
 *   allow_headers = [
 *     "Authorization",
 *     "Content-Type",
 *     "X-Amz-Date",
 *     "X-Amz-Security-Token",
 *     "X-Api-Key",
 *     "next-query",
 *   ]
 * }
 * ```
 *
 * By default, this will create a new `MOCK` endpoint on the provided API Gateway
 * resource allowing CORS preflight requests for **all methods** and
 * **all origins** by default. Of course this can be customized using variables
 * as stated in the next section.
 *
 */

# -----------------------------------------------------------------------------
# Resources: API Gateway
# -----------------------------------------------------------------------------

# aws_api_gateway_method._
resource "aws_api_gateway_method" "_" {
  rest_api_id   = var.api_id
  resource_id   = var.api_resource_id
  http_method   = var.http_method
  authorization = "NONE"
}

# aws_api_gateway_integration._
resource "aws_api_gateway_integration" "_" {
  rest_api_id = var.api_id
  resource_id = var.api_resource_id
  http_method = aws_api_gateway_method._.http_method

  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = var.invoke_arn
  credentials             = var.invoke_policy_arn
}

# aws_api_gateway_integration_response._
resource "aws_api_gateway_integration_response" "_" {
  rest_api_id = var.api_id
  resource_id = var.api_resource_id
  http_method = aws_api_gateway_method._.http_method
  status_code = 200

  response_parameters = local.integration_response_parameters

  depends_on = [
    aws_api_gateway_integration._,
    aws_api_gateway_method_response._,
  ]
}

# aws_api_gateway_method_response._
resource "aws_api_gateway_method_response" "_" {
  rest_api_id = var.api_id
  resource_id = var.api_resource_id
  http_method = aws_api_gateway_method._.http_method
  status_code = 200

  response_parameters = local.method_response_parameters

  response_models = {
    "application/json" = "Empty"
  }

  depends_on = [
    aws_api_gateway_method._,
  ]
}
