class CreateWageRemunerativeConcepts < ActiveRecord::Migration
  def self.up
    create_table :wage_remunerative_concepts do |t|
      t.string :codigo
      t.string :detalle
      t.integer :calculation_type
      t.decimal :valor
      t.string :porcentual_asistencia
      t.string :base_calculo
      t.integer :prioridad_calculo
      t.boolean :pide_datos
      t.integer :statistical_value
      t.string :acumulador_cantidad
      t.belongs_to :concepto_asociado_haber
      t.belongs_to :concepto_asociado_retencion
      t.belongs_to :concepto_asociado_haber_2
      t.belongs_to :concepto_asociado_retencion_2
      t.integer :grupo_ganancias_id
      t.integer :accounting_imputation_id
      t.string :type

      t.timestamps
    end
  end

  def self.down
    drop_table :wage_remunerative_concepts
  end
end
