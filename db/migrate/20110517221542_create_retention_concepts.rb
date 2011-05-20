class CreateRetentionConcepts < ActiveRecord::Migration
  def self.up
    create_table :retention_concepts do |t|
      t.string :codigo
      t.string :detalle
      t.integer :calculation_type
      t.decimal :valor
      t.string :base_calculo
      t.boolean :pide_datos
      t.integer :statistical_value
      t.boolean :es_ganancia
      t.integer :accounting_imputation_id
      t.string  :es_auxiliar_ganancias
      t.string  :grupo_ganancias

      t.timestamps
    end
  end

  def self.down
    drop_table :retention_concepts
  end
end
