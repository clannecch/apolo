module SectionsHelper
  def section_links(section)
    links = []
    links << link_to_unless_current('Visualizar', section)
    links << link_to('Editar', edit_section_path(section))
    links << link_to('Borrar', section, :confirm => 'Esta Seguro?', :method => :delete)

    links.compact.join( " | ").html_safe
  end
end
