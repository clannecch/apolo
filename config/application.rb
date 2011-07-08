require File.expand_path('../boot', __FILE__)

require 'rails/all'

# If you have a Gemfile, require the gems listed there, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env) if defined?(Bundler)

module APSSueldos
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Custom directories with classes and modules you want to be autoloadable.
    # config.autoload_paths += %W(#{config.root}/extras)
    config.autoload_paths += %W(#{Rails.root}/lib/autoload)

    # Only load the plugins named here, in the order given (default is alphabetical).
    # :all can be used as a placeholder for all plugins not explicitly named.
    # config.plugins = [ :exception_notification, :ssl_requirement, :all ]

    # Activate observers that should always be running.
    # config.active_record.observers = :cacher, :garbage_collector, :forum_observer

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'
    config.time_zone = 'Buenos Aires'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
    config.i18n.default_locale = :'es-AR'

    # JavaScript files you want as :defaults (application.js is always included).
    #config.action_view.javascript_expansions[:defaults] = %w(jquery rails)

    # Configure the default encoding used in templates for Ruby 1.9.
    config.encoding = "utf-8"

    # Configure sensitive parameters which will be filtered from the log file.
    config.filter_parameters += [:password, :password_confirmation]

    # Here is where we reap the benefits of the modularity in Rails 3.
    # What this says is that we want to use RSpec as the test framework and we want to generate fixtures
    # with our generated specs, but we don't want to generate view specs and
    # that instead of fixtures, we actually want to use factory girl and
    # we want the factories to be put into spec/factories. Whew! So does this all work?
    config.generators do |generator|
      generator.test_framework :rspec, :fixture => true, :views => true
      generator.fixture_replacement :factory_girl, :dir => 'spec/factories'
    end

    # turn off scaffold stylesheets generate
    config.generators do |generator|
      generator.stylesheets false
    end

    # formtastic datepicker
    config.after_initialize do
      Formtastic::SemanticFormBuilder.send(:include, Apslabs::Formtastic::DatePicker)
    end
  end
end

