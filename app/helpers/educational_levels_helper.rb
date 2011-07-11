module EducationalLevelsHelper
  def educational_level_links(educational_level)
        links = []
        links << link_to_unless_current('Visualizar', educational_level)
        links << link_to('Editar', edit_educational_level_path(educational_level))
        links << link_to('Borrar', educational_level, :confirm => 'Esta Seguro?', :method => :delete)

        links.compact.join( " | ").html_safe

  end
end
