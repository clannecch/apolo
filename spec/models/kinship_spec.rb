# == Schema Information
# Schema version: 20111025214836
#
# Table name: kinships
#
#  id            :integer         not null, primary key
#  name          :string(255)
#  hijo_conyugue :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#  code          :string(255)
#  default       :boolean
#

require 'spec_helper'

describe Kinship do
  pending "add some examples to (or delete) #{__FILE__}"
end
