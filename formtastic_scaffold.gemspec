# -*- encoding: utf-8 -*-
require File.expand_path("../lib/formtastic_scaffold/version", __FILE__)

Gem::Specification.new do |s|
  s.name        = "formtastic_scaffold"
  s.version     = FormtasticScaffold::Scaffold::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Michael Cowden"]
  s.email       = ["michael.cowden@gmail.com"]
  s.homepage    = "http://github.com/xdotcommer/formtastic_scaffold"
  s.summary     = "Scaffold for Formtastic"
  s.description = "Formtastic-scaffold provides formtastic generators for Rails 3."

  s.rubyforge_project         = "formtastic_scaffold"
  s.required_rubygems_version = ">= 1.3.6"

  s.add_dependency "formtastic-bootstrap"
  s.add_dependency "activesupport", "~> 3.0"
  s.add_dependency "actionpack",    "~> 3.0"
  s.add_dependency "railties",      "~> 3.0"

  s.add_development_dependency "rails",   "~> 3.0"
  s.add_development_dependency "bundler", "~> 1.0.0"

  s.files        = `git ls-files`.split("\n")
  s.executables  = `git ls-files`.split("\n").select{|f| f =~ /^bin/}
  s.require_path = 'lib'
end
