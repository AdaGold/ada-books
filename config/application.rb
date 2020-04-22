require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module AdaBooks
  class Application < Rails::Application
  config.generators do |g|
    # Force new test files to be generated in the minitest-spec style
    g.test_framework :minitest, spec: true
  end
  config.generators do |g|
    # Force new test files to be generated in the minitest-spec style
    g.test_framework :minitest, spec: true
    # Always use .js files, never .coffee
    g.javascript_engine :js
  end
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
