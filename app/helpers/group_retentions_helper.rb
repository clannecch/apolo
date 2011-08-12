module GroupRetentionsHelper
  def group_retention_links(group_retention)
        links = []
        links << link_to_unless_current('Visualizar', group_retention)
        links << link_to('Editar', edit_group_retention_path(group_retention))
        links << link_to('Borrar', group_retention, :confirm => 'Esta Seguro?', :method => :delete)

        links.compact.join( " | ").html_safe

  end
end
