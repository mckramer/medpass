require 'spec_helper'

describe "divisions/index.html.erb" do
  before(:each) do
    assign(:divisions, [
      stub_model(Division,
        :name => "Name",
        :abbr => "Abbr",
        :site => nil
      ),
      stub_model(Division,
        :name => "Name",
        :abbr => "Abbr",
        :site => nil
      )
    ])
  end

  it "renders a list of divisions" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Abbr".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
