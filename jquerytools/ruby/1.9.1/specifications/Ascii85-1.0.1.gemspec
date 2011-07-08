# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{Ascii85}
  s.version = "1.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Johannes Holzfu\u00C3\u009F"]
  s.date = %q{2011-05-05}
  s.default_executable = %q{ascii85}
  s.description = %q{Ascii85 provides methods to encode/decode Adobe's binary-to-text encoding of the same name.}
  s.email = %q{DataWraith@web.de}
  s.executables = ["ascii85"]
  s.extra_rdoc_files = ["README.rdoc"]
  s.files = [".gitignore", "Ascii85.gemspec", "Gemfile", "History.txt", "README.rdoc", "Rakefile", "bin/ascii85", "lib/Ascii85/version.rb", "lib/ascii85.rb", "spec/lib/ascii85_spec.rb", "spec/spec_helper.rb"]
  s.homepage = %q{http://rubyforge.org/projects/ascii85/}
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{Ascii85}
  s.rubygems_version = %q{1.5.2}
  s.summary = %q{Ascii85 encoder/decoder}
  s.test_files = ["spec/lib/ascii85_spec.rb", "spec/spec_helper.rb"]

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>, [">= 1.0.0"])
      s.add_development_dependency(%q<rspec>, [">= 2.4.0"])
    else
      s.add_dependency(%q<bundler>, [">= 1.0.0"])
      s.add_dependency(%q<rspec>, [">= 2.4.0"])
    end
  else
    s.add_dependency(%q<bundler>, [">= 1.0.0"])
    s.add_dependency(%q<rspec>, [">= 2.4.0"])
  end
end
