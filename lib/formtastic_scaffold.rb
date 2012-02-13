require 'rails'

module FormtasticScaffold
  module Scaffold
    class Railtie < ::Rails::Railtie
      if ::Rails.version.to_f >= 3.1
        config.app_generators.template_engine :formtastic_scaffold
      else
        config.generators.template_engine :formtastic_scaffold
      end
    end
  end
end
