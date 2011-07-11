module EmailTypesHelper
  def email_type_links(email_type)
        links = []
        links << link_to_unless_current('Visualizar', email_type)
        links << link_to('Editar', edit_email_type_path(email_type))
        links << link_to('Borrar', email_type, :confirm => 'Esta Seguro?', :method => :delete)

        links.compact.join( " | ").html_safe

  end
end
