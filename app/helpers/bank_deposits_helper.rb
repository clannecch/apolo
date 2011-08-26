module BankDepositsHelper
  def bank_deposit_links(bank_deposit)
      links = []
      links << link_to_unless_current('Visualizar', bank_deposit)
      links << link_to('Editar', edit_bank_deposit_path(bank_deposit))
      links << link_to('Borrar', bank_deposit, :confirm => 'Esta Seguro?', :method => :delete)

      links.compact.join( " | ").html_safe

  end

end
