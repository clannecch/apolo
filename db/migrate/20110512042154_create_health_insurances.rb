class CreateHealthInsurances < ActiveRecord::Migration
  def self.up
    create_table :health_insurances do |t|
      t.string :detalle

      t.timestamps
    end
  end

  def self.down
    drop_table :health_insurances
  end
end
