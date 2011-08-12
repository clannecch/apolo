module EmployeeRetentionConceptsHelper
  def employee_links(modelo)
    links = []
    links << link_to_unless_current('Visualizar', employee)
    links << link_to('Editar', edit_employee_path(employee))
    links << link_to('Borrar', employee, :confirm => 'Esta Seguro?', :method => :delete)

    links.compact.join( " | ").html_safe
  end
end
