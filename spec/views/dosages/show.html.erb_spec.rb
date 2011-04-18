require 'spec_helper'

describe "dosages/show.html.erb" do
  before(:each) do
    @dosage = assign(:dosage, stub_model(Dosage,
      :units => "Units",
      :strength => 1,
      :dose => 1,
      :frequency => 1,
      :form => "Form",
      :route => "Route",
      :drug => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Units/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Form/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Route/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
  end
end
