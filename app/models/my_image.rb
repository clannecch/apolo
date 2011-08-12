require 'paperclip'
class MyImage < ActiveRecord::Base
 # Paperclip

 has_attached_file :avatar,
                   :storage => :database,
                   :styles => { :thumb => "75x75>", :small => "150x150>" },
                   :url => '/:class/:id/:attachment?style=:style'
#  send_avatar file_contents(:style),
#      :type => content_type
 default_scope select_without_file_columns_for(:avatar)
end