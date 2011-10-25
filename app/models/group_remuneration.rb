# == Schema Information
# Schema version: 20111024224627
#
# Table name: group_remunerations
#
#  id         :integer         not null, primary key
#  detalle    :string(255)
#  created_at :datetime
#  updated_at :datetime
#  company_id :integer
#  code       :string(255)
#

class GroupRemuneration < ActiveRecord::Base
  has_many :employees, :dependent => :restrict
  #scope :by_company, lambda {|company| where(:company_id => company) }
  default_scope  ($MULTIPLE_COMPANIES == true) ? where(:company_id => $CURRENT_COMPANY) : where(false)

  #has_many :group_remuneration_relation
  #accepts_nested_attributes_for :group_remuneration_relation, :allow_destroy => true
  has_and_belongs_to_many :remunerative_concepts
  validates_presence_of		:detalle, :code,                        :message => "es un dato requerido"
  validates_uniqueness_of		  :code,			                        :message => "existente"
end

