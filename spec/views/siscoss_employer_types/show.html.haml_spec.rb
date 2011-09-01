require 'spec_helper'

describe "siscoss_employer_types/show.html.haml" do
  before(:each) do
    @siscoss_employer_type = assign(:siscoss_employer_type, stub_model(SiscossEmployerType,
      :name => "Name",
      :company_id => 1
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
