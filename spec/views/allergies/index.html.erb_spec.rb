require 'spec_helper'

describe "allergies/index.html.erb" do
  before(:each) do
    assign(:allergies, [
      stub_model(Allergy,
        :user => nil,
        :allergen => nil
      ),
      stub_model(Allergy,
        :user => nil,
        :allergen => nil
      )
    ])
  end

  it "renders a list of allergies" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
