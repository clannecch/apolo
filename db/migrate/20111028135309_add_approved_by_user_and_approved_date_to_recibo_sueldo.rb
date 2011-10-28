class AddApprovedByUserAndApprovedDateToReciboSueldo < ActiveRecord::Migration
  def self.up
    add_column :recibo_sueldos, :approved_by_user_id, :int
    add_column :recibo_sueldos, :approved_date, :datetime
  end

  def self.down
    remove_column :recibo_sueldos, :approved_date
    remove_column :recibo_sueldos, :approved_by_user_id
  end
end
