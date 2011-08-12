module HomeAboutsHelper
def home_about_links(home_about)
    links = []
    links << link_to_unless_current('Visualizar', home_about)
    links << link_to('Editar', edit_home_about_path(home_about))
    links << link_to('Borrar', home_about, :confirm => 'Esta Seguro?', :method => :delete)

    links.compact.join( " | ").html_safe

end
end
