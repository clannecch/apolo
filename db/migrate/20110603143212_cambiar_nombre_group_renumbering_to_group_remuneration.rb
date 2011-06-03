class CambiarNombreGroupRenumberingToGroupRemuneration < ActiveRecord::Migration
  def self.up
        rename_column :employees , :group_renumbering_id , :group_remuneration_id
  end

  def self.down
    rename_column :employees , :group_remuneration_id, :group_renumbering_id
   end
end
