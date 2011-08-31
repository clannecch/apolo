class CreateKinships < ActiveRecord::Migration
  def self.up
    create_table :kinships do |t|
      t.string :name
      t.string :hijo_conyugue

      t.timestamps
    end
  end

  def self.down
    drop_table :kinships
  end
end
