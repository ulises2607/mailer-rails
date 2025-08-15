require "active_support/core_ext/integer/time"

Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # Make code changes take effect immediately without server restart.
  config.enable_reloading = true

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports.
  config.consider_all_requests_local = true

  # Enable server timing.
  config.server_timing = true

  # Enable/disable Action Controller caching. By default Action Controller caching is disabled.
  # Run rails dev:cache to toggle Action Controller caching.
  if Rails.root.join("tmp/caching-dev.txt").exist?
    config.public_file_server.headers = { "cache-control" => "public, max-age=#{2.days.to_i}" }
  else
    config.action_controller.perform_caching = false
  end

  # Change to :null_store to avoid any caching.
  config.cache_store = :memory_store

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    address: ENV['EMAIL_HOST'] || 'mail.institutosancayetanosalta.com',
    port: ENV['EMAIL_PORT']&.to_i || 465,
    user_name: ENV['EMAIL_USER'] || 'tecnico@institutosancayetanosalta.com',
    password: ENV['EMAIL_PASS'] || 'Tco29052022',
    authentication: :plain,
    ssl: ENV['EMAIL_SSL'] == 'true',
    openssl_verify_mode: 'none',
    enable_starttls: false,
    read_timeout: ENV['EMAIL_TIMEOUT']&.to_i || 60,
    open_timeout: ENV['EMAIL_TIMEOUT']&.to_i || 60
  }

  # Make template changes take effect immediately.
  config.action_mailer.perform_caching = false

  # Set localhost to be used by links generated in mailer templates.
  config.action_mailer.default_url_options = { host: "localhost", port: 3000 }

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raises error for missing translations.
  # config.i18n.raise_on_missing_translations = true
end
