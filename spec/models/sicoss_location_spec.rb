# == Schema Information
# Schema version: 20110910142220
#
# Table name: sicoss_locations
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  company_id :integer
#  created_at :datetime
#  updated_at :datetime
#  code       :string(255)
#

require 'spec_helper'

describe SicossLocation do
  pending "add some examples to (or delete) #{__FILE__}"
end
