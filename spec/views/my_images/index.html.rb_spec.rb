require 'spec_helper'

describe "my_images/index.html.erb" do
  before(:each) do
    assign(:my_images, [
      stub_model(MyImage,
        :avatar_file_name => "Avatar File Name",
        :avatar_content_type => "Avatar Content Type",
        :avatar_file_size => 1,
        :detalle => "Detalle"
      ),
      stub_model(MyImage,
        :avatar_file_name => "Avatar File Name",
        :avatar_content_type => "Avatar Content Type",
        :avatar_file_size => 1,
        :detalle => "Detalle"
      )
    ])
  end

  it "renders a list of my_images" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Avatar File Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Avatar Content Type".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Detalle".to_s, :count => 2
  end
end
