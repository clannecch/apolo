class AddColumnCountryIdToProvinces < ActiveRecord::Migration
  def self.up
    add_column :provinces, :country_id, :integer
  end

  def self.down
    remove_column :provinces, :country_id
  end
end
