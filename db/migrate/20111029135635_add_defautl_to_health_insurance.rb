class AddDefautlToHealthInsurance < ActiveRecord::Migration
  def self.up
    add_column :health_insurances, :default, :boolean
  end

  def self.down
    remove_column :health_insurances, :default
  end
end
