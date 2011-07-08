# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{kaminari}
  s.version = "0.12.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Akira Matsuda"]
  s.date = %q{2011-05-04}
  s.description = %q{Kaminari is a Scope & Engine based, clean, powerful, customizable and sophisticated paginator for Rails 3}
  s.email = ["ronnie@dio.jp"]
  s.extra_rdoc_files = ["README.rdoc"]
  s.files = [".document", ".gemtest", ".gitignore", ".rspec", "CHANGELOG", "Gemfile", "LICENSE.txt", "README.rdoc", "Rakefile", "app/views/kaminari/_first_page.html.erb", "app/views/kaminari/_first_page.html.haml", "app/views/kaminari/_first_page.html.slim", "app/views/kaminari/_gap.html.erb", "app/views/kaminari/_gap.html.haml", "app/views/kaminari/_gap.html.slim", "app/views/kaminari/_last_page.html.erb", "app/views/kaminari/_last_page.html.haml", "app/views/kaminari/_last_page.html.slim", "app/views/kaminari/_next_page.html.erb", "app/views/kaminari/_next_page.html.haml", "app/views/kaminari/_next_page.html.slim", "app/views/kaminari/_page.html.erb", "app/views/kaminari/_page.html.haml", "app/views/kaminari/_page.html.slim", "app/views/kaminari/_paginator.html.erb", "app/views/kaminari/_paginator.html.haml", "app/views/kaminari/_paginator.html.slim", "app/views/kaminari/_prev_page.html.erb", "app/views/kaminari/_prev_page.html.haml", "app/views/kaminari/_prev_page.html.slim", "config/locales/kaminari.yml", "kaminari.gemspec", "lib/generators/kaminari/config_generator.rb", "lib/generators/kaminari/templates/kaminari_config.rb", "lib/generators/kaminari/views_generator.rb", "lib/kaminari.rb", "lib/kaminari/config.rb", "lib/kaminari/engine.rb", "lib/kaminari/helpers/action_view_extension.rb", "lib/kaminari/helpers/paginator.rb", "lib/kaminari/helpers/tags.rb", "lib/kaminari/models/active_record_extension.rb", "lib/kaminari/models/active_record_relation_methods.rb", "lib/kaminari/models/array_extension.rb", "lib/kaminari/models/configuration_methods.rb", "lib/kaminari/models/mongo_mapper_extension.rb", "lib/kaminari/models/mongoid_criteria_methods.rb", "lib/kaminari/models/mongoid_extension.rb", "lib/kaminari/models/page_scope_methods.rb", "lib/kaminari/models/plucky_criteria_methods.rb", "lib/kaminari/railtie.rb", "lib/kaminari/version.rb", "spec/acceptance/acceptance_helper.rb", "spec/acceptance/support/helpers.rb", "spec/acceptance/support/paths.rb", "spec/acceptance/users_spec.rb", "spec/config/config_spec.rb", "spec/fake_app.rb", "spec/helpers/action_view_extension_spec.rb", "spec/helpers/helpers_spec.rb", "spec/helpers/tags_spec.rb", "spec/models/active_record_relation_methods_spec.rb", "spec/models/array_spec.rb", "spec/models/default_per_page_spec.rb", "spec/models/mongo_mapper_spec.rb", "spec/models/mongoid_spec.rb", "spec/models/scopes_spec.rb", "spec/spec_helper.rb", "spec/support/database_cleaner.rb", "spec/support/matchers.rb"]
  s.homepage = %q{https://github.com/amatsuda/kaminari}
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{kaminari}
  s.rubygems_version = %q{1.5.2}
  s.summary = %q{A pagination engine plugin for Rails 3}
  s.test_files = ["spec/acceptance/acceptance_helper.rb", "spec/acceptance/support/helpers.rb", "spec/acceptance/support/paths.rb", "spec/acceptance/users_spec.rb", "spec/config/config_spec.rb", "spec/fake_app.rb", "spec/helpers/action_view_extension_spec.rb", "spec/helpers/helpers_spec.rb", "spec/helpers/tags_spec.rb", "spec/models/active_record_relation_methods_spec.rb", "spec/models/array_spec.rb", "spec/models/default_per_page_spec.rb", "spec/models/mongo_mapper_spec.rb", "spec/models/mongoid_spec.rb", "spec/models/scopes_spec.rb", "spec/spec_helper.rb", "spec/support/database_cleaner.rb", "spec/support/matchers.rb"]

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails>, [">= 3.0.0"])
      s.add_development_dependency(%q<bundler>, [">= 1.0.0"])
      s.add_development_dependency(%q<sqlite3>, [">= 0"])
      s.add_development_dependency(%q<mongoid>, [">= 2"])
      s.add_development_dependency(%q<mongo_mapper>, [">= 0.9"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
      s.add_development_dependency(%q<rspec-rails>, [">= 0"])
      s.add_development_dependency(%q<rr>, [">= 0"])
      s.add_development_dependency(%q<steak>, [">= 0"])
      s.add_development_dependency(%q<capybara>, [">= 0"])
      s.add_development_dependency(%q<database_cleaner>, [">= 0"])
    else
      s.add_dependency(%q<rails>, [">= 3.0.0"])
      s.add_dependency(%q<bundler>, [">= 1.0.0"])
      s.add_dependency(%q<sqlite3>, [">= 0"])
      s.add_dependency(%q<mongoid>, [">= 2"])
      s.add_dependency(%q<mongo_mapper>, [">= 0.9"])
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<rspec-rails>, [">= 0"])
      s.add_dependency(%q<rr>, [">= 0"])
      s.add_dependency(%q<steak>, [">= 0"])
      s.add_dependency(%q<capybara>, [">= 0"])
      s.add_dependency(%q<database_cleaner>, [">= 0"])
    end
  else
    s.add_dependency(%q<rails>, [">= 3.0.0"])
    s.add_dependency(%q<bundler>, [">= 1.0.0"])
    s.add_dependency(%q<sqlite3>, [">= 0"])
    s.add_dependency(%q<mongoid>, [">= 2"])
    s.add_dependency(%q<mongo_mapper>, [">= 0.9"])
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<rspec-rails>, [">= 0"])
    s.add_dependency(%q<rr>, [">= 0"])
    s.add_dependency(%q<steak>, [">= 0"])
    s.add_dependency(%q<capybara>, [">= 0"])
    s.add_dependency(%q<database_cleaner>, [">= 0"])
  end
end
