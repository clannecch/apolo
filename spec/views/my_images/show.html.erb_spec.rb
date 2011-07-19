require 'spec_helper'

describe "my_images/show.html.erb" do
  before(:each) do
    @my_image = assign(:my_image, stub_model(MyImage,
      :avatar_file_name => "Avatar File Name",
      :avatar_content_type => "Avatar Content Type",
      :avatar_file_size => 1,
      :detalle => "Detalle"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Avatar File Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Avatar Content Type/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Detalle/)
  end
end
