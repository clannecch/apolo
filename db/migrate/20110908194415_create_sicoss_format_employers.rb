class CreateSicossFormatEmployers < ActiveRecord::Migration
  def self.up
    create_table :sicoss_format_employers do |t|
      t.integer :sicoss_format_id
      t.string :field_type
      t.string :formula
      t.integer :company_id

      t.timestamps
    end
  end

  def self.down
    drop_table :sicoss_format_employers
  end
end
