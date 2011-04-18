require 'spec_helper'

describe "dosages/index.html.erb" do
  before(:each) do
    assign(:dosages, [
      stub_model(Dosage,
        :units => "Units",
        :strength => 1,
        :dose => 1,
        :frequency => 1,
        :form => "Form",
        :route => "Route",
        :drug => nil
      ),
      stub_model(Dosage,
        :units => "Units",
        :strength => 1,
        :dose => 1,
        :frequency => 1,
        :form => "Form",
        :route => "Route",
        :drug => nil
      )
    ])
  end

  it "renders a list of dosages" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Units".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Form".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Route".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
