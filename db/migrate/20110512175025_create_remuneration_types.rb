class CreateRemunerationTypes < ActiveRecord::Migration
  def self.up
    create_table :remuneration_types do |t|
      t.string :detalle

      t.timestamps
    end
  end

  def self.down
    drop_table :remuneration_types
  end
end
