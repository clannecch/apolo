module RemunerativeConceptsHelper
  def remunerative_concept_links(remunerative_concept)
    links = []
    links << link_to_unless_current('Visualizar', remunerative_concept)
    links << link_to('Editar', edit_remunerative_concept_path(remunerative_concept))
    links << link_to('Borrar', remunerative_concept, :confirm => 'Esta Seguro?', :method => :delete)

    links.compact.join( " | ").html_safe
  end

end
