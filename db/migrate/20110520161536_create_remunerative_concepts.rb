class CreateRemunerativeConcepts < ActiveRecord::Migration
  def self.up
    create_table :remunerative_concepts do |t|
      t.string :codigo
      t.string :detalle
      t.integer :calculation_type
      t.decimal :valor
      t.boolean :porcentual_asistencia
      t.string :base_calculo
      t.integer :prioridad_calculo
      t.boolean :pide_datos
      t.integer :statistical_value
      t.string :acumulador_cantidad
      t.integer :grupo_ganancias_id
      t.integer :accounting_imputation_id
      t.belongs_to :concepto_asociado_haber
      t.belongs_to :concepto_asociado_retencion
      t.belongs_to :concepto_asociado_haber_2
      t.belongs_to :concepto_asociado_retencion_2

      t.timestamps
    end
  end

  def self.down
    drop_table :remunerative_concepts
  end
end
