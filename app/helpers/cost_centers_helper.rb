module CostCentersHelper
  def cost_center_links(cost_center)
      links = []
      links << link_to_unless_current('Visualizar', cost_center)
      links << link_to('Editar', edit_cost_center_path(cost_center))
      links << link_to('Borrar', cost_center, :confirm => 'Esta Seguro?', :method => :delete)

      links.compact.join( " | ").html_safe

  end
end
