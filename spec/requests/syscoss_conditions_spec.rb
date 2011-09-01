require 'spec_helper'

describe "SyscossConditions" do
  describe "GET /syscoss_conditions" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get syscoss_conditions_path
      response.status.should be(200)
    end
  end
end
