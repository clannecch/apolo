module LiquidacionsHelper

  def liquidacion_links(liquidacion)
      links = []
      links << link_to_unless_current('Visualizar', liquidacion)
      links << link_to('Editar', edit_liquidacion_path(liquidacion))
      links << link_to('Borrar', liquidacion, :confirm => 'Esta Seguro?', :method => :delete)

      links.compact.join( " | ").html_safe

  end
end
