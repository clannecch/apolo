class RemovePorcentualAsistenciaToRemunerativeConcept < ActiveRecord::Migration
  def self.up
    remove_column :remunerative_concepts, :porcentual_asistencia

  end

  def self.down
    add_column :remunerative_concepts, :porcentual_asistencia , :boolean
  end
end
