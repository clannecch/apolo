class CreateCharacterServices < ActiveRecord::Migration
  def self.up
    create_table :character_services do |t|
      t.string :detalle

      t.timestamps
    end
  end

  def self.down
    drop_table :character_services
  end
end
