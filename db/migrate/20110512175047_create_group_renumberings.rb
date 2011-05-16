class CreateGroupRenumberings < ActiveRecord::Migration
  def self.up
    create_table :group_renumberings do |t|
      t.string :detalle

      t.timestamps
    end
  end

  def self.down
    drop_table :group_renumberings
  end
end
