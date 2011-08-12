module ProvincesHelper

  def province_links(province)
    links = []
    links << link_to_unless_current('Visualizar', province)
    links << link_to('Editar', edit_province_path(province))
    links << link_to('Borrar', province, :confirm => 'Esta Seguro?', :method => :delete)

    links.compact.join( " | ").html_safe
  end
end
