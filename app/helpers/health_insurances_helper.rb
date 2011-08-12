module HealthInsurancesHelper
def health_insurance_links(health_insurance)
      links = []
      links << link_to_unless_current('Visualizar', health_insurance)
      links << link_to('Editar', edit_health_insurance_path(health_insurance))
      links << link_to('Borrar', health_insurance, :confirm => 'Esta Seguro?', :method => :delete)

      links.compact.join( " | ").html_safe

  end
end
