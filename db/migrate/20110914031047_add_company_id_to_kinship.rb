class AddCompanyIdToKinship < ActiveRecord::Migration
  def self.up
    add_column :kinships, :company_id, :integer
  end

  def self.down
    remove_column :kinships, :company_id
  end
end
