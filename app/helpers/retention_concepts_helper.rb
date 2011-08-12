module RetentionConceptsHelper
  def retention_concept_links(retention_concept)
    links = []
    links << link_to_unless_current('Visualizar', retention_concept)
    links << link_to('Editar', edit_retention_concept_path(retention_concept))
    links << link_to('Borrar', retention_concept, :confirm => 'Esta Seguro?', :method => :delete)
    links.compact.join( " | ").html_safe
  end
end
