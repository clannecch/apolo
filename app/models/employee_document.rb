class EmployeeDocument < ActiveRecord::Base
  belongs_to :employee
  has_attached_file :document,
                  :storage => :database,
                  :styles => { :thumb => "75x75>", :small => "150x150>" },
                  :url => '/:class/:id/:attachment?style=:style'
  default_scope select_without_file_columns_for(:document)
end
