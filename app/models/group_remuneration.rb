class GroupRemuneration < ActiveRecord::Base
  #has_many :group_remuneration_relation
  #accepts_nested_attributes_for :group_remuneration_relation, :allow_destroy => true
  has_and_belongs_to_many :remunerative_concepts
end

