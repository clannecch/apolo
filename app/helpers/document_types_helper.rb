module DocumentTypesHelper
  def document_type_links(document_type)
        links = []
        links << link_to_unless_current('Visualizar', document_type)
        links << link_to('Editar', edit_document_type_path(document_type))
        links << link_to('Borrar', document_type, :confirm => 'Esta Seguro?', :method => :delete)

        links.compact.join( " | ").html_safe
  end
end
