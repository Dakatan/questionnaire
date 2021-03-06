require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Darjeeling
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # No field with errors.
    config.action_view.field_error_proc = Proc.new do |html_tag, instance|
      %Q(#{html_tag}).html_safe
    end

    # Lang is JP.
    config.i18n.default_locale = :ja
  end
end
