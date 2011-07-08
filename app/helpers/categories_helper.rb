module CategoriesHelper
  def category_links(category)
      links = []
      links << link_to_unless_current('Visualizar', category)
      links << link_to('Editar', edit_category_path(category))
      links << link_to('Borrar', category, :confirm => 'Esta Seguro?', :method => :delete)

      links.compact.join( " | ").html_safe

  end
end
