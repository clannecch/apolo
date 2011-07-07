module CountriesHelper
def country_links(country)
    links = []
    links << link_to_unless_current('Visualizar', country) #if can?(Country, :calcular)
    links << link_to('Editar', edit_country_path(country))
    links << link_to('Borrar', country, :confirm => 'Esta Seguro?', :method => :delete)

    links.compact.join( " | ").html_safe

end
end
