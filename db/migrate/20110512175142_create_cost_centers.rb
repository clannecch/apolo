class CreateCostCenters < ActiveRecord::Migration
  def self.up
    create_table :cost_centers do |t|
      t.string :detalle

      t.timestamps
    end
  end

  def self.down
    drop_table :cost_centers
  end
end
