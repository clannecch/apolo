class RemoveCajaYNumeroToConsortium < ActiveRecord::Migration
  def self.up
    remove_column :consortia, :caja
    remove_column :consortia, :numero_inscripcion
  end

  def self.down
    add_column :consortia, :caja, :string
    add_column :consortia, :numero_inscripcion, :string
  end
end
