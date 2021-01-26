require 'views_schema'
require 'rails'

module ViewsSchema
  class Railtie < Rails::Railtie
    railtie_name :views_schema

    rake_tasks do
      path = File.expand_path(__dir__)
      Dir.glob("#{path}/tasks/**/*.rake").each { |f| load f }
    end
  end
end
