module LocationsHelper

def location_links(location)
    links = []
    links << link_to_unless_current('Visualizar', location)
    links << link_to('Editar', edit_location_path(location))
    links << link_to('Borrar', location, :confirm => 'Esta Seguro?', :method => :delete)

    links.compact.join( " | ").html_safe

end
end
