module PlacesHelper
  def place_links(place)
    links = []
    links << link_to_unless_current('Visualizar', place)
    links << link_to('Editar', edit_place_path(place))
    links << link_to('Borrar', place, :confirm => 'Esta Seguro?', :method => :delete)

    links.compact.join( " | ").html_safe

  end
end
