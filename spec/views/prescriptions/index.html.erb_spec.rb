require 'spec_helper'

describe "prescriptions/index.html.erb" do
  before(:each) do
    assign(:prescriptions, [
      stub_model(Prescription,
        :drug => nil,
        :indication => nil,
        :dosage => nil,
        :user => nil
      ),
      stub_model(Prescription,
        :drug => nil,
        :indication => nil,
        :dosage => nil,
        :user => nil
      )
    ])
  end

  it "renders a list of prescriptions" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
