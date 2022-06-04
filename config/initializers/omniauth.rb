Rails.application.config.middleware.use OmniAuth::Builder do
  provider :okta, Rails.application.credentials.okta.client_id!, Rails.application.credentials.okta.client_secret!, {
    client_options: {
      site: "https://#{Rails.application.credentials.okta.host!}",
      authorization_server: Rails.application.credentials.okta.authorization_server!,
      authorize_url: "https://#{Rails.application.credentials.okta.host!}/oauth2/v1/authorize",
      token_url: "https://#{Rails.application.credentials.okta.host!}/oauth2/v1/token",
      user_info_url: "https://#{Rails.application.credentials.okta.host!}/oauth2/v1/userinfo",
      audience: "api://#{Rails.application.credentials.okta.authorization_server!}"
    }
  }
end
