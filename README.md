<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
# Terraform AWS API Gateway CORS Lambda Proxy

## Description

A Terraform module to create a Cross-Origin Resource Sharing (CORS) Lambda Proxy.

Orignal code forked from [squidfunk/terraform-aws-api-gateway-enable-cors](https://github.com/squidfunk/terraform-aws-api-gateway-enable-cors)

## Usage

``` hcl
module "cors_lambda" {
  source = "dod-iac/api-gateway-cors-lambda-proxy/aws"
  version = "1.0.0"

  api_id            = aws_api_gateway_rest_api.main_api.id
  api_resource_id   = aws_api_gateway_resource.main_api_streams_resource.id
  http_method       = "GET"
  invoke_arn        = aws_lambda_function.stream_lambda.invoke_arn
  invoke_policy_arn = aws_iam_role.api_role.arn
  allow_methods = [
    "OPTIONS",
    "GET"
  ]
  allow_headers = [
    "Authorization",
    "Content-Type",
    "X-Amz-Date",
    "X-Amz-Security-Token",
    "X-Api-Key",
    "next-query",
  ]
}
```

By default, this will create a new `MOCK` endpoint on the provided API Gateway
resource allowing CORS preflight requests for **all methods** and
**all origins** by default. Of course this can be customized using variables
as stated in the next section.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 3.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_api_gateway_integration._](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_integration) | resource |
| [aws_api_gateway_integration_response._](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_integration_response) | resource |
| [aws_api_gateway_method._](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_method) | resource |
| [aws_api_gateway_method_response._](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_method_response) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allow_credentials"></a> [allow\_credentials](#input\_allow\_credentials) | Allow credentials (`Access-Control-Allow-Credentials`) | `bool` | `false` | no |
| <a name="input_allow_headers"></a> [allow\_headers](#input\_allow\_headers) | Allow headers (`Access-Control-Allow-Headers`) | `list(string)` | <pre>[<br>  "Authorization",<br>  "Content-Type",<br>  "X-Amz-Date",<br>  "X-Amz-Security-Token",<br>  "X-Api-Key"<br>]</pre> | no |
| <a name="input_allow_max_age"></a> [allow\_max\_age](#input\_allow\_max\_age) | Allow response caching time (`Access-Control-Allow-Max-Age`) | `string` | `"7200"` | no |
| <a name="input_allow_methods"></a> [allow\_methods](#input\_allow\_methods) | Allow methods (`Access-Control-Allow-Methods`) | `list(string)` | <pre>[<br>  "OPTIONS",<br>  "HEAD",<br>  "GET",<br>  "POST",<br>  "PUT",<br>  "PATCH",<br>  "DELETE"<br>]</pre> | no |
| <a name="input_allow_origin"></a> [allow\_origin](#input\_allow\_origin) | Allow origin (`Access-Control-Allow-Origin`) | `string` | `"*"` | no |
| <a name="input_api_id"></a> [api\_id](#input\_api\_id) | API identifier | `any` | n/a | yes |
| <a name="input_api_resource_id"></a> [api\_resource\_id](#input\_api\_resource\_id) | API resource identifier | `any` | n/a | yes |
| <a name="input_http_method"></a> [http\_method](#input\_http\_method) | API http method | `any` | n/a | yes |
| <a name="input_invoke_arn"></a> [invoke\_arn](#input\_invoke\_arn) | API Lambda Invoke ARN | `any` | n/a | yes |
| <a name="input_invoke_policy_arn"></a> [invoke\_policy\_arn](#input\_invoke\_policy\_arn) | IAM Policy to allow Lambda invoke | `any` | n/a | yes |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
