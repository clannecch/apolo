require 'spec_helper'

describe "SicossDamageds" do
  describe "GET /sicoss_damageds" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get sicoss_damageds_path
      response.status.should be(200)
    end
  end
end
