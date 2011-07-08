module AccountingImputationsHelper
  def accounting_imputation_links(accounting_imputation)
      links = []
      links << link_to_unless_current('Visualizar', accounting_imputation)
      links << link_to('Editar', edit_accounting_imputation_path(accounting_imputation))
      links << link_to('Borrar', accounting_imputation, :confirm => 'Esta Seguro?', :method => :delete)

      links.compact.join( " | ").html_safe

  end
end
