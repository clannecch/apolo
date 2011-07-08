# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{prawn}
  s.version = "0.11.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.3.6") if s.respond_to? :required_rubygems_version=
  s.authors = ["Gregory Brown", "Brad Ediger", "Daniel Nelson", "Jonathen Greenberg", "James Healy"]
  s.date = %q{2011-04-03}
  s.description = %q{  Prawn is a fast, tiny, and nimble PDF generator for Ruby
}
  s.email = ["gregory.t.brown@gmail.com", "brad@bradediger.com", "dnelson@bluejade.com", "greenberg@entryway.net", "jimmy@deefa.com"]
  s.extra_rdoc_files = ["HACKING", "README", "LICENSE", "COPYING"]
  s.files = ["examples/example_helper.rb", "examples/bounding_box/stretched_nesting.rb", "examples/bounding_box/bounding_boxes.rb", "examples/bounding_box/indentation.rb", "examples/bounding_box/russian_boxes.rb", "examples/table/multi_page_table.rb", "examples/table/header.rb", "examples/table/checkerboard.rb", "examples/table/inline_format_table.rb", "examples/table/borders.rb", "examples/table/simple_table.rb", "examples/table/subtable.rb", "examples/table/bill.rb", "examples/table/widths.rb", "examples/table/cell.rb", "examples/security/hello_foo.rb", "examples/text/span.rb", "examples/text/simple_text_ttf.rb", "examples/text/inline_format.rb", "examples/text/font_size.rb", "examples/text/text_flow.rb", "examples/text/family_based_styling.rb", "examples/text/text_box_returning_excess.rb", "examples/text/alignment.rb", "examples/text/shaped_text_box.rb", "examples/text/font_calculations.rb", "examples/text/text_box.rb", "examples/text/rotated.rb", "examples/text/indent_paragraphs.rb", "examples/text/simple_text.rb", "examples/text/hyphenation.rb", "examples/text/character_spacing.rb", "examples/text/rendering_mode.rb", "examples/text/dfont.rb", "examples/text/kerning.rb", "examples/general/canvas.rb", "examples/general/measurement_units.rb", "examples/general/templates.rb", "examples/general/repeaters.rb", "examples/general/context_sensitive_headers.rb", "examples/general/page_numbering.rb", "examples/general/multi_page_layout.rb", "examples/general/float.rb", "examples/general/page_geometry.rb", "examples/general/margin.rb", "examples/general/outlines.rb", "examples/general/background.rb", "examples/general/metadata-info.rb", "examples/general/stamp.rb", "examples/general/page_templates.rb", "examples/graphics/line.rb", "examples/graphics/ruport_style_helpers.rb", "examples/graphics/image_position.rb", "examples/graphics/polygons.rb", "examples/graphics/gradient.rb", "examples/graphics/image_fit.rb", "examples/graphics/curves.rb", "examples/graphics/stroke_bounds.rb", "examples/graphics/transformations.rb", "examples/graphics/rounded_rectangle.rb", "examples/graphics/transparency.rb", "examples/graphics/stroke_cap_and_join.rb", "examples/graphics/png_types.rb", "examples/graphics/cmyk.rb", "examples/graphics/rounded_polygons.rb", "examples/graphics/hexagon.rb", "examples/graphics/remote_images.rb", "examples/graphics/image_flow.rb", "examples/graphics/stroke_dash.rb", "examples/graphics/basic_images.rb", "examples/grid/multi_boxes.rb", "examples/grid/bounding_boxes.rb", "examples/grid/simple_grid.rb", "examples/grid/show_grid.rb", "examples/grid/column_gutter_grid.rb", "examples/m17n/euro.rb", "examples/m17n/utf8.rb", "examples/m17n/sjis.rb", "examples/m17n/full_win_ansi_character_list.rb", "examples/m17n/chinese_text_wrapping.rb", "examples/m17n/win_ansi_charset.rb", "lib/prawn.rb", "lib/prawn/core.rb", "lib/prawn/errors.rb", "lib/prawn/text.rb", "lib/prawn/images.rb", "lib/prawn/core/object_store.rb", "lib/prawn/core/byte_string.rb", "lib/prawn/core/text.rb", "lib/prawn/core/pdf_object.rb", "lib/prawn/core/document_state.rb", "lib/prawn/core/destinations.rb", "lib/prawn/core/reference.rb", "lib/prawn/core/annotations.rb", "lib/prawn/core/page.rb", "lib/prawn/core/name_tree.rb", "lib/prawn/core/text/formatted/wrap.rb", "lib/prawn/core/text/formatted/arranger.rb", "lib/prawn/core/text/formatted/line_wrap.rb", "lib/prawn/core/literal_string.rb", "lib/prawn/measurements.rb", "lib/prawn/compatibility.rb", "lib/prawn/repeater.rb", "lib/prawn/measurement_extensions.rb", "lib/prawn/document.rb", "lib/prawn/images/jpg.rb", "lib/prawn/images/png.rb", "lib/prawn/encoding.rb", "lib/prawn/table/cells.rb", "lib/prawn/table/cell/text.rb", "lib/prawn/table/cell/in_table.rb", "lib/prawn/table/cell/subtable.rb", "lib/prawn/table/cell.rb", "lib/prawn/graphics.rb", "lib/prawn/security/arcfour.rb", "lib/prawn/document/span.rb", "lib/prawn/document/snapshot.rb", "lib/prawn/document/bounding_box.rb", "lib/prawn/document/internals.rb", "lib/prawn/document/page_geometry.rb", "lib/prawn/document/graphics_state.rb", "lib/prawn/document/column_box.rb", "lib/prawn/layout/grid.rb", "lib/prawn/text/formatted/parser.rb", "lib/prawn/text/formatted/fragment.rb", "lib/prawn/text/formatted/box.rb", "lib/prawn/text/box.rb", "lib/prawn/text/formatted.rb", "lib/prawn/font/ttf.rb", "lib/prawn/font/afm.rb", "lib/prawn/font/dfont.rb", "lib/prawn/graphics/join_style.rb", "lib/prawn/graphics/gradient.rb", "lib/prawn/graphics/transformation.rb", "lib/prawn/graphics/cap_style.rb", "lib/prawn/graphics/transparency.rb", "lib/prawn/graphics/color.rb", "lib/prawn/graphics/dash.rb", "lib/prawn/layout.rb", "lib/prawn/stamp.rb", "lib/prawn/table.rb", "lib/prawn/outline.rb", "lib/prawn/font.rb", "lib/prawn/security.rb", "spec/text_spacing_spec.rb", "spec/annotations_spec.rb", "spec/jpg_spec.rb", "spec/object_store_spec.rb", "spec/snapshot_spec.rb", "spec/measurement_units_spec.rb", "spec/inline_formatted_text_parser_spec.rb", "spec/reference_spec.rb", "spec/graphics_spec.rb", "spec/stamp_spec.rb", "spec/bounding_box_spec.rb", "spec/transparency_spec.rb", "spec/spec_helper.rb", "spec/document_spec.rb", "spec/font_spec.rb", "spec/text_box_spec.rb", "spec/text_with_inline_formatting_spec.rb", "spec/images_spec.rb", "spec/text_at_spec.rb", "spec/destinations_spec.rb", "spec/png_spec.rb", "spec/name_tree_spec.rb", "spec/formatted_text_arranger_spec.rb", "spec/line_wrap_spec.rb", "spec/template_spec.rb", "spec/formatted_text_fragment_spec.rb", "spec/span_spec.rb", "spec/extensions/mocha.rb", "spec/text_rendering_mode_spec.rb", "spec/outline_spec.rb", "spec/cell_spec.rb", "spec/stroke_styles_spec.rb", "spec/formatted_text_box_spec.rb", "spec/text_spec.rb", "spec/pdf_object_spec.rb", "spec/security_spec.rb", "spec/table_spec.rb", "spec/repeater_spec.rb", "spec/grid_spec.rb", "data/encodings/win_ansi.txt", "data/fonts/comicsans.ttf", "data/fonts/Times-Roman.afm", "data/fonts/Courier-Oblique.afm", "data/fonts/Helvetica-BoldOblique.afm", "data/fonts/Symbol.afm", "data/fonts/Helvetica-Bold.afm", "data/fonts/ZapfDingbats.afm", "data/fonts/Times-BoldItalic.afm", "data/fonts/Dustismo_Roman.ttf", "data/fonts/Courier.afm", "data/fonts/Helvetica-Oblique.afm", "data/fonts/Chalkboard.ttf", "data/fonts/Courier-Bold.afm", "data/fonts/Activa.ttf", "data/fonts/Courier-BoldOblique.afm", "data/fonts/Helvetica.afm", "data/fonts/DejaVuSans.ttf", "data/fonts/MustRead.html", "data/fonts/Times-Italic.afm", "data/fonts/gkai00mp.ttf", "data/fonts/Action Man.dfont", "data/fonts/Times-Bold.afm", "data/images/16bit.png", "data/images/page_white_text.alpha", "data/images/tru256.bmp", "data/images/arrow.png", "data/images/letterhead.jpg", "data/images/barcode_issue.png", "data/images/web-links.png", "data/images/ruport.png", "data/images/prawn.png", "data/images/dice.dat", "data/images/page_white_text.dat", "data/images/dice.alpha", "data/images/dice_interlaced.png", "data/images/rails.png", "data/images/ruport_type0.png", "data/images/ruport_data.dat", "data/images/fractal.jpg", "data/images/stef.jpg", "data/images/web-links.dat", "data/images/arrow2.png", "data/images/page_white_text.png", "data/images/16bit.dat", "data/images/pigs.jpg", "data/images/ruport_transparent.png", "data/images/dice.png", "data/images/rails.dat", "data/images/16bit.alpha", "data/shift_jis_text.txt", "data/pdfs/encrypted.pdf", "data/pdfs/nested_pages.pdf", "data/pdfs/resources_as_indirect_object.pdf", "data/pdfs/hexagon.pdf", "data/pdfs/form.pdf", "data/pdfs/complex_template.pdf", "data/pdfs/multipage_template.pdf", "data/pdfs/version_1_6.pdf", "data/pdfs/two_hexagons.pdf", "data/pdfs/page_without_mediabox.pdf", "data/pdfs/contains_ttf_font.pdf", "data/pdfs/indirect_reference.pdf", "Rakefile", "prawn.gemspec", "HACKING", "README", "LICENSE", "COPYING"]
  s.homepage = %q{http://prawn.majesticseacreature.com}
  s.post_install_message = %q{
********************************************


A lot has changed since 0.8.4

Please read the changelog for details:

https://github.com/sandal/prawn/wiki/CHANGELOG


********************************************

}
  s.rdoc_options = ["--title", "Prawn Documentation", "--main", "README", "-q"]
  s.require_paths = ["lib"]
  s.required_ruby_version = Gem::Requirement.new(">= 1.8.7")
  s.rubyforge_project = %q{prawn}
  s.rubygems_version = %q{1.5.2}
  s.summary = %q{A fast and nimble PDF generator for Ruby}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<pdf-reader>, [">= 0.9.0"])
      s.add_runtime_dependency(%q<ttfunk>, ["~> 1.0.0"])
    else
      s.add_dependency(%q<pdf-reader>, [">= 0.9.0"])
      s.add_dependency(%q<ttfunk>, ["~> 1.0.0"])
    end
  else
    s.add_dependency(%q<pdf-reader>, [">= 0.9.0"])
    s.add_dependency(%q<ttfunk>, ["~> 1.0.0"])
  end
end
