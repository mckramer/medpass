require 'spec_helper'

describe "conditions/index.html.erb" do
  before(:each) do
    assign(:conditions, [
      stub_model(Condition,
        :name => "Name",
        :abbr => "Abbr",
        :description => "MyText",
        :icd9 => "Icd9"
      ),
      stub_model(Condition,
        :name => "Name",
        :abbr => "Abbr",
        :description => "MyText",
        :icd9 => "Icd9"
      )
    ])
  end

  it "renders a list of conditions" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Abbr".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Icd9".to_s, :count => 2
  end
end
