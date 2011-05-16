class CreateIssueds < ActiveRecord::Migration
  def self.up
    create_table :issueds do |t|
      t.string :detalle

      t.timestamps
    end
  end

  def self.down
    drop_table :issueds
  end
end
