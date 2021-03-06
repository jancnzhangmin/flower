require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Flower
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    config.active_record.default_timezone = :local
    config.time_zone = 'Beijing'
    #config.middleware.insert_before 0, Rack::Cors do
    #  allow do
    #    origins '*'
    #    resource '*', :headers => :any, :methods => [:get, :post, :options]
    #  end
    #end
    config.action_cable.disable_request_forgery_protection = true
    config.active_job.queue_adapter = :sidekiq
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
