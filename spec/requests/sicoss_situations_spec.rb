require 'spec_helper'

describe "SicossSituations" do
  describe "GET /sicoss_situations" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get sicoss_situations_path
      response.status.should be(200)
    end
  end
end
