module EmployerContributionConceptsHelper
  def employer_contribution_concept_links(employer_contribution_concept)
      links = []
      links << link_to_unless_current('Visualizar', employer_contribution_concept)
      links << link_to('Editar', edit_employer_contribution_concept_path(employer_contribution_concept))
      links << link_to('Borrar', employer_contribution_concept, :confirm => 'Esta Seguro?', :method => :delete)

      links.compact.join( " | ").html_safe

  end
end
