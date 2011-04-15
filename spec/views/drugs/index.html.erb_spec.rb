require 'spec_helper'

describe "drugs/index.html.erb" do
  before(:each) do
    assign(:drugs, [
      stub_model(Drug,
        :name => "Name",
        :abbr => "Abbr",
        :description => "MyText",
        :parent_id => 1
      ),
      stub_model(Drug,
        :name => "Name",
        :abbr => "Abbr",
        :description => "MyText",
        :parent_id => 1
      )
    ])
  end

  it "renders a list of drugs" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Abbr".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
