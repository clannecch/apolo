require 'spec_helper'

describe "SyscossReductionZones" do
  describe "GET /syscoss_reduction_zones" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get syscoss_reduction_zones_path
      response.status.should be(200)
    end
  end
end