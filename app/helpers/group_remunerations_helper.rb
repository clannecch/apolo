module GroupRemunerationsHelper
  def group_remuneration_links(group_remuneration)
        links = []
        links << link_to_unless_current('Visualizar', group_remuneration)
        links << link_to('Editar', edit_group_remuneration_path(group_remuneration))
        links << link_to('Borrar', group_remuneration, :confirm => 'Esta Seguro?', :method => :delete)

        links.compact.join( " | ").html_safe

  end
end
