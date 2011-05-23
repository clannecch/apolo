class GroupRemunerationRelation < ActiveRecord::Base
  has_many :group_remunerations
  has_many :remunerative_concepts
end
