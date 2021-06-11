
# -----------------------------------------------------------------------------
# Variables: API Gateway
# -----------------------------------------------------------------------------

# var.api_id
variable "api_id" {
  description = "API identifier"
}

# var.api_resource_id
variable "api_resource_id" {
  description = "API resource identifier"
}

# var.http_method
variable "http_method" {
  description = "API http method"
}

# var.invoke_arn
variable "invoke_arn" {
  description = "API Lambda Invoke ARN"
}

# var.invoke_policy_arn
variable "invoke_policy_arn" {
  description = "IAM Policy to allow Lambda invoke"
}

# -----------------------------------------------------------------------------
# Variables: CORS-related
# -----------------------------------------------------------------------------

# var.allow_headers
variable "allow_headers" {
  description = "Allow headers (`Access-Control-Allow-Headers`)"
  type        = list(string)

  default = [
    "Authorization",
    "Content-Type",
    "X-Amz-Date",
    "X-Amz-Security-Token",
    "X-Api-Key",
  ]
}

# var.allow_methods
variable "allow_methods" {
  description = "Allow methods (`Access-Control-Allow-Methods`)"
  type        = list(string)

  default = [
    "OPTIONS",
    "HEAD",
    "GET",
    "POST",
    "PUT",
    "PATCH",
    "DELETE",
  ]
}

# var.allow_origin
variable "allow_origin" {
  description = "Allow origin (`Access-Control-Allow-Origin`)"
  type        = string
  default     = "*"
}

# var.allow_max_age
variable "allow_max_age" {
  description = "Allow response caching time (`Access-Control-Allow-Max-Age`)"
  type        = string
  default     = "7200"
}

# var.allowed_credentials
variable "allow_credentials" {
  description = "Allow credentials (`Access-Control-Allow-Credentials`)"
  default     = false
}
