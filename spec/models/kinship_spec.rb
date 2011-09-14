# == Schema Information
# Schema version: 20110914031047
#
# Table name: kinships
#
#  id            :integer         not null, primary key
#  name          :string(255)
#  hijo_conyugue :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#  company_id    :integer
#

require 'spec_helper'

describe Kinship do
  pending "add some examples to (or delete) #{__FILE__}"
end
