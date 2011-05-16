class CreateLaborUnions < ActiveRecord::Migration
  def self.up
    create_table :labor_unions do |t|
      t.string :detalle

      t.timestamps
    end
  end

  def self.down
    drop_table :labor_unions
  end
end
