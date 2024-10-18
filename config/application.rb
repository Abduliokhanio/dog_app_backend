require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module DogApp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1
    config.api_only = true

    config.middleware.delete Webpacker::DevServerProxy
    config.middleware.delete Rack::MiniProfiler
    config.middleware.delete ActionDispatch::HostAuthorization
    config.middleware.delete ActionDispatch::Static
    config.middleware.delete Sprockets::Rails::QuietAssets
    config.middleware.delete WebConsole::Middleware
    config.middleware.delete ActionDispatch::ShowExceptions
    config.middleware.delete ActionDispatch::DebugExceptions
    config.middleware.delete Rack::Sendfile
    config.middleware.delete ActionDispatch::ActionableExceptions

    config.autoload_paths += %W(#{config.root}/app/workers)
    config.time_zone = 'Central Time (US & Canada)'

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
