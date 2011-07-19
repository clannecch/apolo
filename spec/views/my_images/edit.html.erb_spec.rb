require 'spec_helper'

describe "my_images/edit.html.erb" do
  before(:each) do
    @my_image = assign(:my_image, stub_model(MyImage,
      :avatar_file_name => "MyString",
      :avatar_content_type => "MyString",
      :avatar_file_size => 1,
      :detalle => "MyString"
    ))
  end

  it "renders the edit my_image form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => my_images_path(@my_image), :method => "post" do
      assert_select "input#my_image_avatar_file_name", :name => "my_image[avatar_file_name]"
      assert_select "input#my_image_avatar_content_type", :name => "my_image[avatar_content_type]"
      assert_select "input#my_image_avatar_file_size", :name => "my_image[avatar_file_size]"
      assert_select "input#my_image_detalle", :name => "my_image[detalle]"
    end
  end
end
