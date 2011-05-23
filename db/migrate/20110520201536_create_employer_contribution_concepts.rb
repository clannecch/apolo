class CreateEmployerContributionConcepts < ActiveRecord::Migration
  def self.up
    create_table :employer_contribution_concepts do |t|
      t.string :codigo
      t.string :detalle
      t.integer :calculation_type
      t.decimal :valor
      t.string :base_calculo
      t.boolean :pide_datos
      t.integer :statistical_value
      t.integer :accounting_imputation_id

      t.timestamps
    end
  end

  def self.down
    drop_table :employer_contribution_concepts
  end
end
