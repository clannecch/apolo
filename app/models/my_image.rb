require 'paperclip'
class MyImage < ActiveRecord::Base
  # Paperclip
  has_attached_file :avatar,
    :styles => {
      :thumb=> "100x100#",
      :small  => "150x150>" }
end
