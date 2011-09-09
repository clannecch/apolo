class AddCodeToEmployerTypes < ActiveRecord::Migration
  def self.up
    add_column :sicoss_employer_types, :code, :string
  end

  def self.down
    remove_column :sicoss_employer_types, :code
  end
end
