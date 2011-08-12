module DeduccionGananciasTablesHelper
  def deduccion_ganancias_table_links(deduccion_ganancias_table)
      links = []
      links << link_to_unless_current('Visualizar', deduccion_ganancias_table)
      links << link_to('Editar', edit_deduccion_ganancias_table_path(deduccion_ganancias_table))
      links << link_to('Borrar', deduccion_ganancias_table, :confirm => 'Esta Seguro?', :method => :delete)

      links.compact.join( " | ").html_safe

  end
end
