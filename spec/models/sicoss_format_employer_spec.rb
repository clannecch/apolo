# == Schema Information
# Schema version: 20110910142220
#
# Table name: sicoss_format_employers
#
#  id               :integer         not null, primary key
#  sicoss_format_id :integer
#  field_type       :string(255)
#  formula          :string(255)
#  company_id       :integer
#  created_at       :datetime
#  updated_at       :datetime
#

require 'spec_helper'

describe SicossFormatEmployer do
  pending "add some examples to (or delete) #{__FILE__}"
end
