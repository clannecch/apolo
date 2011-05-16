class AddParte2ToEmployee < ActiveRecord::Migration
  def self.up
    add_column :employees, :movil, :string
    add_column :employees, :email, :string
    add_column :employees, :category_id, :integer
    add_column :employees, :section_id, :integer
    add_column :employees, :task_id, :integer
    add_column :employees, :place_id, :integer
    add_column :employees, :character_service_id, :integer
    add_column :employees, :matricula_nacional, :string
    add_column :employees, :matricula_provincial, :string
    add_column :employees, :discapacidad, :string
    add_column :employees, :health_insurance_id, :integer
    add_column :employees, :plan_osocial, :string
    add_column :employees, :numero_afiliado_osocial, :string
    add_column :employees, :cargas_extras_osocial, :integer
    add_column :employees, :labor_union_id, :integer
    add_column :employees, :numero_afiliado_sindicato, :string
    add_column :employees, :numero_jubilacion, :string
    add_column :employees, :numero_ganancias, :string
    add_column :employees, :cuit, :string
    add_column :employees, :cuil, :string
  end

  def self.down
    remove_column :employees, :cuil
    remove_column :employees, :cuit
    remove_column :employees, :numero_ganancias
    remove_column :employees, :numero_jubilacion
    remove_column :employees, :numero_afiliado_sindicato
    remove_column :employees, :labor_union_id
    remove_column :employees, :cargas_extras_osocial
    remove_column :employees, :numero_afiliado_osocial
    remove_column :employees, :plan_osocial
    remove_column :employees, :health_insurance_id
    remove_column :employees, :discapacidad
    remove_column :employees, :matricula_provincial
    remove_column :employees, :matricula_nacional
    remove_column :employees, :character_service_id
    remove_column :employees, :place_id
    remove_column :employees, :task_id
    remove_column :employees, :section_id
    remove_column :employees, :category_id
    remove_column :employees, :email
    remove_column :employees, :movil
  end
end
