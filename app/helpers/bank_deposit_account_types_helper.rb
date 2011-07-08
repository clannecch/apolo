module BankDepositAccountTypesHelper
  def bank_deposit_account_type_links(bank_deposit_account_type)
      links = []
      links << link_to_unless_current('Visualizar', bank_deposit_account_type)
      links << link_to('Editar', edit_bank_deposit_type_path(bank_deposit_account_type))
      links << link_to('Borrar', bank_deposit_account_type, :confirm => 'Esta Seguro?', :method => :delete)

      links.compact.join( " | ").html_safe

  end
end
