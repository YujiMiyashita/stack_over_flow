Devise.setup do |config|

  require 'devise/orm/active_record'

  config.mailer_sender = 'noreply@dive23.com'
  config.case_insensitive_keys = [:email]
  config.strip_whitespace_keys = [:email]
  config.skip_session_storage = [:http_auth]
  config.stretches = Rails.env.test? ? 1 : 11
  config.reconfirmable = true
  config.expire_all_remember_me_on_sign_out = true
  config.password_length = 6..128
  config.email_regexp = /\A[^@\s]+@[^@\s]+\z/
  config.reset_password_within = 6.hours
  config.sign_out_via = :delete
  config.secret_key = 'd59ba957013f6592021929c3b4421977ba1cfacf3ae991a57de3df379f38d19b6121530c43d349732dda488733e2d0ff864fc32f89cdabd61cd3d9e6883a2586'

  if Rails.env.production?
    config.omniauth :facebook, ENV["FACEBOOK_ID_PRODUCTION"], ENV["FACEBOOK_SECRET_PRODUCTION"], scope: 'email', display: 'popup', info_fields: 'name, email',image_size: 'large'
    config.omniauth :google_oauth2, ENV["GOOGLE_ID_PRODUCTION"], ENV["GOOGLE_SECRET_PRODUCTION"], scope: 'email', display: 'popup', info_fields: 'name, email'
  else
    config.omniauth :facebook, ENV["FACEBOOK_ID_DEVELOPMENT"], ENV["FACEBOOK_SECRET_DEVELOPMENT"], scope: 'email', display: 'popup', info_fields: 'name, email',image_size: 'large'
    config.omniauth :google_oauth2, ENV["GOOGLE_ID_DEVELOPMENT"], ENV["GOOGLE_SECRET_DEVELOPMENT"], scope: 'email', display: 'popup', info_fields: 'name, email'
  end
end
