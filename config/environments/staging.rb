require_relative 'production'

Rails.application.routes.default_url_options[:host] = 'http://pixel.demostage.me/'

Pixel::Application.configure do
  config.consider_all_requests_local = true
  config.log_level = :debug
  config.action_mailer.delivery_method = :sendmail
end