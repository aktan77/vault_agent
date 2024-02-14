pid_file = "apps/vault/pidfile"

vault {
  address = "https://19d73b6fe41c.mylabserver.com:443"
  retry {
    num_retries = 5
  }
}

auto_auth {
  method {
    type = "token_file"

    config {
      token_file_path = "/apps/vault/secret/.vault-token"
    }
  }
}

api_proxy {
  use_auto_auth_token = true
}

listener "tcp" {
  address = "127.0.0.1:8100"
  tls_disable = true
}

template_config {
  exit_on_retry_failure = true
  static_secret_render_interval = "10m"
}