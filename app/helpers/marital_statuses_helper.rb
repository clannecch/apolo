module MaritalStatusesHelper
  def marital_status_links(marital_status)
      links = []
      links << link_to_unless_current('Visualizar', marital_status)
      links << link_to('Editar', edit_marital_status_path(marital_status))
      links << link_to('Borrar', marital_status, :confirm => 'Esta Seguro?', :method => :delete)

      links.compact.join( " | ").html_safe

  end
end
