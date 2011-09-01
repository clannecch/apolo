require 'spec_helper'

describe "SicossContractModes" do
  describe "GET /sicoss_contract_modes" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get sicoss_contract_modes_path
      response.status.should be(200)
    end
  end
end
