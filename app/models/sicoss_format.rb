# == Schema Information
# Schema version: 20110910142220
#
# Table name: sicoss_formats
#
#  id                 :integer         not null, primary key
#  position           :integer
#  name               :string(255)
#  field_length       :integer
#  justifies          :string(255)
#  fill_character     :string(255)
#  formula            :string(255)
#  company_id         :integer
#  created_at         :datetime
#  updated_at         :datetime
#  field_type         :string(255)
#  number_of_decimals :integer
#  modifiable         :boolean
#

class SicossFormat < ActiveRecord::Base
  has_many :sicoss_format_employers
  validates_presence_of		    :name,:field_length,:justifies,:field_type,       :message => "es un dato requerido"

end
