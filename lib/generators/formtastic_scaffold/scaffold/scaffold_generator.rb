require 'rails/generators/erb/scaffold/scaffold_generator'

module FormtasticScaffold
  module Generators
    class ScaffoldGenerator < Erb::Generators::ScaffoldGenerator
      source_root File.expand_path("../templates", __FILE__)

      def copy_view_files
        available_views.each do |view|
          template "#{view}.html.erb", File.join("app/views", controller_file_path, "#{view}.html.erb")
        end
      end

      hook_for :form_builder, :as => :scaffold

      def copy_form_file
        if options[:form_builder].nil?
          template "_form.html.erb", File.join("app/views", controller_file_path, "_form.html.erb")
        end
      end

    protected

      def available_views
        %w(index edit show new)
      end

      def handler
        :formtastic_scaffold
      end

    end
  end
end
