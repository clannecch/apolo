require 'spec_helper'

describe "kinships/show.html.haml" do
  before(:each) do
    @kinship = assign(:kinship, stub_model(Kinship,
      :name => "Name",
      :hijo_conyugue => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
