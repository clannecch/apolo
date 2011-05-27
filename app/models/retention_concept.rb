class RetentionConcept < ActiveRecord::Base
  has_and_belongs_to_many :group_retentions
end
