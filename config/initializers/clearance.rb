Clearance.configure do |config|
  config.routes = false
  config.mailer_sender = "reply@example.com"
  config.rotate_csrf_on_sign_in = true
  # config.url_after_denied_access_when_signed_out = "/session_new"
end
