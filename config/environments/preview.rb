Andesconexion::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb

  # In the development environment your application's code is reloaded on
  # every request.  This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Log error messages when you accidentally call methods on nil.
  config.whiny_nils = true

  # Show full error reports and disable caching
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true

  # Don't care if the mailer can't send
  config.action_mailer.raise_delivery_errors = true

  # Print deprecation notices to the Rails logger
  config.active_support.deprecation = :log

  # Only use best-standards-support built into browsers
  config.action_dispatch.best_standards_support = :builtin

  # Do not compress assets
  config.assets.compress = true

  # Expands the lines which load the assets   
  config.middleware.use ExceptionNotifier,
    :email_prefix => "[AndesConexion Preview] ",
    :sender_address => %{"notifier" <notifier@andesconexion-preview.fabianraf.com>},
    :exception_recipients => %w{fabianraf@gmail.com}
    
  config.action_mailer.default_url_options = { :host => 'andesconexion-preview.fabianraf.com' }      
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {:enable_starttls_auto => false}
end
