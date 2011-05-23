class CreateGroupRemunerations < ActiveRecord::Migration
  def self.up
    create_table :group_remunerations do |t|
      t.string :detalle

      t.timestamps
    end
  end

  def self.down
    drop_table :group_remunerations
  end
end
