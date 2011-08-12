module TipoRecibosHelper
  def tipo_recibo_links(tipo_recibo)
    links = []
    links << link_to_unless_current('Visualizar', tipo_recibo)
    links << link_to('Editar', edit_tipo_recibo_path(tipo_recibo))
    links << link_to('Borrar', tipo_recibo, :confirm => 'Esta Seguro?', :method => :delete)

    links.compact.join( " | ").html_safe

  end
end
