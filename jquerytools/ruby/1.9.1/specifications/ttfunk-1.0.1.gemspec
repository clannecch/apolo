# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{ttfunk}
  s.version = "1.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.3.6") if s.respond_to? :required_rubygems_version=
  s.authors = ["Gregory Brown", "Brad Ediger", "Daniel Nelson", "Jonathen Greenberg", "James Healy"]
  s.date = %q{2011-04-02}
  s.description = %q{Get Ya TrueType Funk On! (Font Metrics Parser for Prawn)}
  s.email = ["gregory.t.brown@gmail.com", "brad@bradediger.com", "dnelson@bluejade.com", "greenberg@entryway.net", "jimmy@deefa.com"]
  s.files = ["lib/ttfunk.rb", "lib/ttfunk/encoding/windows_1252.rb", "lib/ttfunk/encoding/mac_roman.rb", "lib/ttfunk/resource_file.rb", "lib/ttfunk/subset.rb", "lib/ttfunk/directory.rb", "lib/ttfunk/subset/unicode.rb", "lib/ttfunk/subset/windows_1252.rb", "lib/ttfunk/subset/unicode_8bit.rb", "lib/ttfunk/subset/mac_roman.rb", "lib/ttfunk/subset/base.rb", "lib/ttfunk/table/hhea.rb", "lib/ttfunk/table/post.rb", "lib/ttfunk/table/kern/format0.rb", "lib/ttfunk/table/os2.rb", "lib/ttfunk/table/glyf/compound.rb", "lib/ttfunk/table/glyf/simple.rb", "lib/ttfunk/table/simple.rb", "lib/ttfunk/table/hmtx.rb", "lib/ttfunk/table/loca.rb", "lib/ttfunk/table/cmap/format04.rb", "lib/ttfunk/table/cmap/format00.rb", "lib/ttfunk/table/cmap/subtable.rb", "lib/ttfunk/table/cmap.rb", "lib/ttfunk/table/maxp.rb", "lib/ttfunk/table/post/format40.rb", "lib/ttfunk/table/post/format20.rb", "lib/ttfunk/table/post/format25.rb", "lib/ttfunk/table/post/format30.rb", "lib/ttfunk/table/post/format10.rb", "lib/ttfunk/table/name.rb", "lib/ttfunk/table/kern.rb", "lib/ttfunk/table/glyf.rb", "lib/ttfunk/table/head.rb", "lib/ttfunk/reader.rb", "lib/ttfunk/subset_collection.rb", "lib/ttfunk/table.rb", "data/fonts/comicsans.ttf", "data/fonts/DejaVuSans.ttf", "examples/metrics.rb", "CHANGELOG", "README.rdoc"]
  s.require_paths = ["lib"]
  s.required_ruby_version = Gem::Requirement.new(">= 1.8.7")
  s.rubygems_version = %q{1.5.2}
  s.summary = %q{TrueType Font Metrics Parser}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
