require 'spec_helper'

describe "SicossLocations" do
  describe "GET /sicoss_locations" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get sicoss_locations_path
      response.status.should be(200)
    end
  end
end
