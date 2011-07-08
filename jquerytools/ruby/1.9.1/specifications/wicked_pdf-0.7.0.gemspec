# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{wicked_pdf}
  s.version = "0.7.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Miles Z. Sterret"]
  s.date = %q{2011-05-10}
  s.description = %q{Wicked PDF uses the shell utility wkhtmltopdf to serve a PDF file to a user from HTML.
In other words, rather than dealing with a PDF generation DSL of some sort,
you simply write an HTML view as you would normally, and let Wicked take care of the hard stuff.
}
  s.email = %q{miles.sterrett@gmail.com}
  s.files = ["README.md", "Rakefile", "MIT-LICENSE", "lib/generators/wicked_pdf_generator.rb", "lib/pdf_helper.rb", "lib/wicked_pdf.rb", "lib/wicked_pdf_helper.rb", "lib/wicked_pdf_railtie.rb", "lib/wicked_pdf_tempfile.rb", "test/fixtures/wicked.css", "test/pdf_helper_test.rb", "test/test_helper.rb", "test/wicked_pdf_helper_test.rb", "test/wicked_pdf_test.rb"]
  s.homepage = %q{http://github.com/mileszs/wicked_pdf}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.5.2}
  s.summary = %q{PDF generator (from HTML) plugin for Ruby on Rails}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
