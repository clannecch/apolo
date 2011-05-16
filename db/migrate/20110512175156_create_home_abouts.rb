class CreateHomeAbouts < ActiveRecord::Migration
  def self.up
    create_table :home_abouts do |t|
      t.string :detalle

      t.timestamps
    end
  end

  def self.down
    drop_table :home_abouts
  end
end
