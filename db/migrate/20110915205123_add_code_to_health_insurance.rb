class AddCodeToHealthInsurance < ActiveRecord::Migration
  def self.up
    add_column :health_insurances, :code, :string
  end

  def self.down
    remove_column :health_insurances, :code
  end
end
