# == Schema Information
# Schema version: 20111024224627
#
# Table name: kinships
#
#  id            :integer         not null, primary key
#  name          :string(255)
#  hijo_conyugue :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#  code          :string(255)
#

require 'spec_helper'

describe Kinship do
  pending "add some examples to (or delete) #{__FILE__}"
end
