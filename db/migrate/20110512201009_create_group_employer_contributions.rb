class CreateGroupEmployerContributions < ActiveRecord::Migration
  def self.up
    create_table :group_employer_contributions do |t|
      t.string :detalle

      t.timestamps
    end
  end

  def self.down
    drop_table :group_employer_contributions
  end
end
