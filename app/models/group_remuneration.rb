class GroupRemuneration < ActiveRecord::Base
  has_many :group_remuneration_relation
  accepts_nested_attributes_for :group_remuneration_relation, :allow_destroy => true
end
