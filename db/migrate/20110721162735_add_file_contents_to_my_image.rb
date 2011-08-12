class AddFileContentsToMyImage < ActiveRecord::Migration
  def self.up
    add_column :my_images, :avatar_file , :longblob
    add_column :my_images, :avatar_thumb_file , :longblob
    add_column :my_images, :avatar_small_file , :longblob
  end

  def self.down
    remove_column :my_images, :avatar_file
    remove_column :my_images, :avatar_thumb_file
    remove_column :my_images, :avatar_small_file
  end
end
