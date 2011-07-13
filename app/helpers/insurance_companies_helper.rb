module InsuranceCompaniesHelper
  def insurance_company_links(insurance_company)
    links = []
    links << link_to_unless_current('Visualizar', insurance_company)
    links << link_to('Editar', edit_insurance_company_path(insurance_company))
    links << link_to('Borrar', insurance_company, :confirm => 'Esta Seguro?', :method => :delete)

    links.compact.join( " | ").html_safe

  end
end
