require 'spec_helper'

describe "SiscossRegimen" do
  describe "GET /siscoss_regimen" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get siscoss_regimen_path
      response.status.should be(200)
    end
  end
end
