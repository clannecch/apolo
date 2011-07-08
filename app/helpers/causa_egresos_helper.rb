module CausaEgresosHelper
  def causa_egreso_links(causa_egreso)
      links = []
      links << link_to_unless_current('Visualizar', causa_egreso)
      links << link_to('Editar', edit_causa_egreso_path(causa_egreso))
      links << link_to('Borrar', causa_egreso, :confirm => 'Esta Seguro?', :method => :delete)

      links.compact.join( " | ").html_safe

  end
end
