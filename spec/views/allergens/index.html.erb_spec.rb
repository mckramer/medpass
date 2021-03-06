require 'spec_helper'

describe "allergens/index.html.erb" do
  before(:each) do
    assign(:allergens, [
      stub_model(Allergen,
        :name => "Name",
        :abbr => "Abbr",
        :description => "MyText"
      ),
      stub_model(Allergen,
        :name => "Name",
        :abbr => "Abbr",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of allergens" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Abbr".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
