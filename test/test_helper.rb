require 'rubygems'
require 'test/unit'
require 'rails/all'
require 'rails/generators'
require 'rails/generators/test_case'

class TestApp < Rails::Application
  config.root = File.dirname(__FILE__)
end
Rails.application = TestApp

module Rails
  def self.root
    @root ||= File.expand_path(File.join(File.dirname(__FILE__), '..', 'tmp', 'rails'))
  end
end
Rails.application.config.root = Rails.root

# Call configure to load the settings from
# Rails.application.config.generators to Rails::Generators
Rails::Generators.configure! Rails.application.config.generators

Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

def copy_routes
  routes = File.expand_path(File.join(File.dirname(__FILE__), 'fixtures', 'routes.rb'))
  destination = File.join(Rails.root, "config")
  FileUtils.mkdir_p(destination)
  FileUtils.cp File.expand_path(routes), destination
end

# Asserts the given class exists in the given content. When a block is given,
# it yields the content of the class.
#
#   assert_file "test/functional/accounts_controller_test.rb" do |controller_test|
#     assert_class "AccountsControllerTest", controller_test do |klass|
#       assert_match /context "index action"/, klass
#     end
#   end
#
def assert_class(klass, content)
  assert content =~ /class #{klass}(\(.+\))?(.*?)\nend/m, "Expected to have class #{klass}"
  yield $2.strip if block_given?
end

def generator_list
  {
    :rails                => ['scaffold'],
    :formtastic_scaffold  => ['scaffold']
  }
end

def path_prefix(name)
  case name
  when :rails
    'rails/generators'
  else
    'generators'
  end
end

def require_generators(generator_list)
  generator_list.each do |name, generators|
    generators.each do |generator_name|
      require File.join(path_prefix(name), name.to_s, generator_name.to_s, "#{generator_name}_generator")
    end
  end
end
alias :require_generator :require_generators

require_generators generator_list