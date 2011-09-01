require 'spec_helper'

describe "syscoss_employer_types/show.html.haml" do
  before(:each) do
    @syscoss_employer_type = assign(:syscoss_employer_type, stub_model(SyscossEmployerType,
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
