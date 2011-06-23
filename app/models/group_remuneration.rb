# == Schema Information
# Schema version: 20110621182933
#
# Table name: group_remunerations
#
#  id         :integer         not null, primary key
#  detalle    :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class GroupRemuneration < ActiveRecord::Base
  #has_many :group_remuneration_relation
  #accepts_nested_attributes_for :group_remuneration_relation, :allow_destroy => true
  has_many :employees
  has_and_belongs_to_many :remunerative_concepts
  validates_presence_of		:detalle, :message => "es un dato requerido"
end

