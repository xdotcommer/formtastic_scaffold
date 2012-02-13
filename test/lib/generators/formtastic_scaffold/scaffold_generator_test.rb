require 'test_helper'
require 'lib/generators/formtastic_scaffold/testing_helper'

class FormtasticScaffold::Generators::ScaffoldGeneratorTest < Rails::Generators::TestCase
  destination File.join(Rails.root)
  tests Rails::Generators::ScaffoldGenerator
  arguments %w(product_line title:string price:integer --template-engine formtastic_scaffold)

  setup :prepare_destination
  setup :copy_routes

  test "should invoke template engine" do
    run_generator

    %w(index edit new show _form).each { |view| assert_file "app/views/product_lines/#{view}.html.erb" }
    assert_no_file "app/views/layouts/product_lines.html.erb"
  end

  test "should revoke template engine" do
    run_generator
    run_generator ["product_line"], :behavior => :revoke

    assert_no_file "app/views/product_lines"
    assert_no_file "app/views/layouts/product_lines.html.erb"
  end

  test "should invoke form builder" do
    run_generator %w(product_line title:string price:integer --template-engine formtastic_scaffold --form-builder some-form-builder)
    assert_no_file "app/views/product_lines/_form.html.erb"
  end
end
