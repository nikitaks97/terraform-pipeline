plugin "aws" {
  enabled = true
  version = "0.17.0" # or latest
  source  = "github.com/terraform-linters/tflint-ruleset-aws"
  region  = "us-east-1"
}