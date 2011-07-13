module LaborUnionsHelper

def labor_union_links(labor_union)
    links = []
    links << link_to_unless_current('Visualizar', labor_union)
    links << link_to('Editar', edit_labor_union_path(labor_union))
    links << link_to('Borrar', labor_union, :confirm => 'Esta Seguro?', :method => :delete)

    links.compact.join( " | ").html_safe

end
end
