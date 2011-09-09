class CreateSicossFormats < ActiveRecord::Migration
  def self.up
    create_table :sicoss_formats do |t|
      t.integer :position
      t.string :name
      t.integer :field_length
      t.integer :Number_of_decimals
      t.string :justifies
      t.string :fill_character
      t.string :formula
      t.integer :company_id

      t.timestamps
    end
  end

  def self.down
    drop_table :sicoss_formats
  end
end
