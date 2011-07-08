module ContractModesHelper
  def contract_mode_links(contract_mode)
      links = []
      links << link_to_unless_current('Visualizar', contract_mode)
      links << link_to('Editar', edit_contract_mode_path(contract_mode))
      links << link_to('Borrar', contract_mode, :confirm => 'Esta Seguro?', :method => :delete)

      links.compact.join( " | ").html_safe

  end
end
