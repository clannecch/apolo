module TasksHelper
  def task_links(task)
    links = []
    links << link_to_unless_current('Visualizar', task)
    links << link_to('Editar', edit_task_path(task))
    links << link_to('Borrar', task, :confirm => 'Esta Seguro?', :method => :delete)

    links.compact.join( " | ").html_safe

  end
end
