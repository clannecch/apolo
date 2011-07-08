# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{attrtastic}
  s.version = "0.4.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Boruta Miros\u0142aw"]
  s.date = %q{2011-06-24}
  s.description = %q{Rails view helper for scaffolding show/index pages for objects}
  s.email = ["boruta.miroslaw@gmail.com"]
  s.files = [".document", ".gitignore", "Gemfile", "Gemfile.lock", "LICENSE", "README.md", "Rakefile", "attrtastic.gemspec", "doc/Attrtastic.html", "doc/Attrtastic/Railtie.html", "doc/Attrtastic/SemanticAttributesBuilder.html", "doc/Attrtastic/SemanticAttributesHelper.html", "doc/_index.html", "doc/class_list.html", "doc/css/common.css", "doc/css/full_list.css", "doc/css/style.css", "doc/file.README.html", "doc/file_list.html", "doc/frames.html", "doc/index.html", "doc/js/app.js", "doc/js/full_list.js", "doc/js/jquery.js", "doc/method_list.html", "doc/top-level-namespace.html", "init.rb", "lib/attrtastic.rb", "lib/attrtastic/railtie.rb", "lib/attrtastic/semantic_attributes_builder.rb", "lib/attrtastic/semantic_attributes_helper.rb", "lib/attrtastic/version.rb", "test/helper.rb", "test/test_attribute.rb", "test/test_attributes.rb", "test/test_attrtastic.rb", "test/test_semantic_attributes_helper.rb"]
  s.homepage = %q{http://github.com/MBO/attrtastic}
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{attrtastic}
  s.rubygems_version = %q{1.5.2}
  s.summary = %q{Rails view helper for scaffolding show/index pages for objects}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<yard>, ["~> 0.6.0"])
      s.add_development_dependency(%q<bluecloth>, ["~> 2.0.0"])
      s.add_development_dependency(%q<shoulda>, ["~> 2.11.0"])
      s.add_runtime_dependency(%q<activesupport>, [">= 3.0"])
      s.add_runtime_dependency(%q<actionpack>, [">= 3.0"])
    else
      s.add_dependency(%q<yard>, ["~> 0.6.0"])
      s.add_dependency(%q<bluecloth>, ["~> 2.0.0"])
      s.add_dependency(%q<shoulda>, ["~> 2.11.0"])
      s.add_dependency(%q<activesupport>, [">= 3.0"])
      s.add_dependency(%q<actionpack>, [">= 3.0"])
    end
  else
    s.add_dependency(%q<yard>, ["~> 0.6.0"])
    s.add_dependency(%q<bluecloth>, ["~> 2.0.0"])
    s.add_dependency(%q<shoulda>, ["~> 2.11.0"])
    s.add_dependency(%q<activesupport>, [">= 3.0"])
    s.add_dependency(%q<actionpack>, [">= 3.0"])
  end
end
