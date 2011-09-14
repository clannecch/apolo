# == Schema Information
# Schema version: 20110910142220
#
# Table name: sicoss_reduction_zones
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  company_id :integer
#  created_at :datetime
#  updated_at :datetime
#  code       :string(255)
#

require 'spec_helper'

describe SicossReductionZone do
  pending "add some examples to (or delete) #{__FILE__}"
end
