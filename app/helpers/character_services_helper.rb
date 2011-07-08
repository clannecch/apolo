module CharacterServicesHelper
  def character_service_links(character_service)
      links = []
      links << link_to_unless_current('Visualizar', character_service)
      links << link_to('Editar', edit_character_service_path(character_service))
      links << link_to('Borrar', character_service, :confirm => 'Esta Seguro?', :method => :delete)

      links.compact.join( " | ").html_safe

  end
end
