require 'spec_helper'

describe "kinships/index.html.haml" do
  before(:each) do
    assign(:kinships, [
      stub_model(Kinship,
        :name => "Name",
        :hijo_conyugue => 1
      ),
      stub_model(Kinship,
        :name => "Name",
        :hijo_conyugue => 1
      )
    ])
  end

  it "renders a list of kinships" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
