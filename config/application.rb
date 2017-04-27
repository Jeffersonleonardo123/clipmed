require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Clipmed
  class Application < Rails::Application
# config.autoload_paths += %W(#{Rails.root}/app/services)
    # config.autoload_paths += %W(#{config.root}/app)
    # importa todas a pastas dentro da app
    # config.autoload_paths << Rails.root.join('app/**')
    config.autoload_paths += %W(#{config.root}/app/services)
    config.time_zone = 'Brasilia'

    config.i18n.default_locale = :'pt-BR'

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true

    Time::DATE_FORMATS[:default] = "%d/%m/%Y %H:%M"
    Date::DATE_FORMATS[:default] = "%d/%m/%Y"
  end
end
