require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module PaiBookMgt
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # skip generating test file
    config.generators do |g|
        g.test_framework false
        g.helper_framework false
    end

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    config.time_zone = "Asia/Tokyo"
    # config.eager_load_paths << Rails.root.join("extras")

    # Prevent layout collapse due to error messages
    config.action_view.field_error_proc = Proc.new { |html_tag, instance| html_tag }

    # default locale
    config.i18n.default_locale = :ja

    # default active record timezone
    config.active_record.default_timezone = :local

    # Read .yml in all directories under config/locales
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]
  end
end
