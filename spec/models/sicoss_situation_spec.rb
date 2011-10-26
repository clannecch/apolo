# == Schema Information
# Schema version: 20111025214836
#
# Table name: sicoss_situations
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  company_id :integer
#  created_at :datetime
#  updated_at :datetime
#  code       :string(255)
#  default    :boolean
#

require 'spec_helper'

describe SicossSituation do
  pending "add some examples to (or delete) #{__FILE__}"
end
