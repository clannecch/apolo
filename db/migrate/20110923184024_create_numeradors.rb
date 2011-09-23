class CreateNumeradors < ActiveRecord::Migration
  def self.up
    create_table :numeradors do |t|
      t.string :code
      t.string :name
      t.decimal :number
      t.integer :company_id

      t.timestamps
    end
  end

  def self.down
    drop_table :numeradors
  end
end
