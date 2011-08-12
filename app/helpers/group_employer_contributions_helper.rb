module GroupEmployerContributionsHelper
  def group_employer_contribution_links(group_employer_contribution)
    links = []
    links << link_to_unless_current('Visualizar', group_employer_contribution)
    links << link_to('Editar', edit_group_employer_contribution_path(group_employer_contribution))
    links << link_to('Borrar', group_employer_contribution, :confirm => 'Esta Seguro?', :method => :delete)

    links.compact.join( " | ").html_safe

  end
end
