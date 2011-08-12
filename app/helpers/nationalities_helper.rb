module NationalitiesHelper
  def nationality_links(nationality)
      links = []
      links << link_to_unless_current('Visualizar', nationality)
      links << link_to('Editar', edit_nationality_path(nationality))
      links << link_to('Borrar', nationality, :confirm => 'Esta Seguro?', :method => :delete)

      links.compact.join( " | ").html_safe
  end
end
