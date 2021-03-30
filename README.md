<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
# CORS Lambda Proxy

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

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
| <a name="input_allow_credentials"></a> [allow\_credentials](#input\_allow\_credentials) | Allow credentials | `bool` | `false` | no |
| <a name="input_allow_headers"></a> [allow\_headers](#input\_allow\_headers) | Allow headers | `list(string)` | <pre>[<br>  "Authorization",<br>  "Content-Type",<br>  "X-Amz-Date",<br>  "X-Amz-Security-Token",<br>  "X-Api-Key"<br>]</pre> | no |
| <a name="input_allow_max_age"></a> [allow\_max\_age](#input\_allow\_max\_age) | Allow response caching time | `string` | `"7200"` | no |
| <a name="input_allow_methods"></a> [allow\_methods](#input\_allow\_methods) | Allow methods | `list(string)` | <pre>[<br>  "OPTIONS",<br>  "HEAD",<br>  "GET",<br>  "POST",<br>  "PUT",<br>  "PATCH",<br>  "DELETE"<br>]</pre> | no |
| <a name="input_allow_origin"></a> [allow\_origin](#input\_allow\_origin) | Allow origin | `string` | `"*"` | no |
| <a name="input_api_id"></a> [api\_id](#input\_api\_id) | API identifier | `any` | n/a | yes |
| <a name="input_api_resource_id"></a> [api\_resource\_id](#input\_api\_resource\_id) | API resource identifier | `any` | n/a | yes |
| <a name="input_http_method"></a> [http\_method](#input\_http\_method) | API http method | `any` | n/a | yes |
| <a name="input_invoke_arn"></a> [invoke\_arn](#input\_invoke\_arn) | API Lambda Invoke ARN | `any` | n/a | yes |
| <a name="input_invoke_policy_arn"></a> [invoke\_policy\_arn](#input\_invoke\_policy\_arn) | IAM Policy to allow Lambda invoke | `any` | n/a | yes |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
