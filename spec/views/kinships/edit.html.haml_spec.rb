require 'spec_helper'

describe "kinships/edit.html.haml" do
  before(:each) do
    @kinship = assign(:kinship, stub_model(Kinship,
      :name => "MyString",
      :hijo_conyugue => 1
    ))
  end

  it "renders the edit kinship form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => kinships_path(@kinship), :method => "post" do
      assert_select "input#kinship_name", :name => "kinship[name]"
      assert_select "input#kinship_hijo_conyugue", :name => "kinship[hijo_conyugue]"
    end
  end
end
