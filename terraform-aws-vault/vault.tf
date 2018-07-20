provider "vault" {}

data "vault_aws_access_credentials" "aws_creds" {
  backend = "${var.aws_backend}"
  role    = "${var.aws_role}"
}
