module IssuedsHelper
def issued_links(issued)
    links = []
    links << link_to_unless_current('Visualizar', issued)
    links << link_to('Editar', edit_issued_path(issued))
    links << link_to('Borrar', issued, :confirm => 'Esta Seguro?', :method => :delete)

    links.compact.join( " | ").html_safe

end
end
