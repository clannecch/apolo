module RemunerationTypesHelper
  def remuneration_type_links(remuneration_type)
      links = []
      links << link_to_unless_current('Visualizar', remuneration_type)
      links << link_to('Editar', edit_remuneration_type_path(remuneration_type))
      links << link_to('Borrar', remuneration_type, :confirm => 'Esta Seguro?', :method => :delete)

      links.compact.join( " | ").html_safe
  end

end
