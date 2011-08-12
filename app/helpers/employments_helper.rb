module EmploymentsHelper
  def employment_links(employment)
      links = []
      links << link_to_unless_current('Visualizar', employment)
      links << link_to('Editar', edit_employment_path(employment))
      links << link_to('Borrar', employment, :confirm => 'Esta Seguro?', :method => :delete)

      links.compact.join( " | ").html_safe

  end
end
