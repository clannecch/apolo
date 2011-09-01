class CreateSicossLocations < ActiveRecord::Migration
  def self.up
    create_table :sicoss_locations do |t|
      t.string :name
      t.integer :company_id

      t.timestamps
    end
  end

  def self.down
    drop_table :sicoss_locations
  end
end
