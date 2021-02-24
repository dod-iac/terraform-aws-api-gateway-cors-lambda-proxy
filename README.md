<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
# CORS Lambda Proxy

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Modules

No Modules.

## Resources

| Name |
|------|
| [aws_api_gateway_integration](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_integration) |
| [aws_api_gateway_integration_response](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_integration_response) |
| [aws_api_gateway_method](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_method) |
| [aws_api_gateway_method_response](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_method_response) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| allow\_credentials | Allow credentials | `bool` | `false` | no |
| allow\_headers | Allow headers | `list(string)` | <pre>[<br>  "Authorization",<br>  "Content-Type",<br>  "X-Amz-Date",<br>  "X-Amz-Security-Token",<br>  "X-Api-Key"<br>]</pre> | no |
| allow\_max\_age | Allow response caching time | `string` | `"7200"` | no |
| allow\_methods | Allow methods | `list(string)` | <pre>[<br>  "OPTIONS",<br>  "HEAD",<br>  "GET",<br>  "POST",<br>  "PUT",<br>  "PATCH",<br>  "DELETE"<br>]</pre> | no |
| allow\_origin | Allow origin | `string` | `"*"` | no |
| api\_id | API identifier | `any` | n/a | yes |
| api\_resource\_id | API resource identifier | `any` | n/a | yes |
| http\_method | API http method | `any` | n/a | yes |
| invoke\_arn | API Lambda Invoke ARN | `any` | n/a | yes |
| invoke\_policy\_arn | IAM Policy to allow Lambda invoke | `any` | n/a | yes |

## Outputs

No output.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
