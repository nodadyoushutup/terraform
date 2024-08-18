provider "postgresql" {
  host            = local.provider.postgresql.host
  port            = local.provider.postgresql.port
  database        = local.provider.postgresql.database
  username        = local.provider.postgresql.username
  password        = local.provider.postgresql.password
  sslmode         = local.provider.postgresql.sslmode
  connect_timeout = local.provider.postgresql.connect_timeout
  clientcert {
    cert = local.provider.postgresql.clientcert.cert
    key = local.provider.postgresql.clientcert.key
  }
}

resource "postgresql_role" "role_vault" {
  name = "vault"
}

resource "postgresql_user_mapping" "vault" {
  server_name = local.provider.postgresql.host
  user_name   = "vault"
  options = {
    user = "vault"
    password = "vault"
  }
}