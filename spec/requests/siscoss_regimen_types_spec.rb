require 'spec_helper'

describe "SiscossRegimenTypes" do
  describe "GET /siscoss_regimen_types" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get siscoss_regimen_types_path
      response.status.should be(200)
    end
  end
end
