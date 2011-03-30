require 'spec_helper'

describe "allergens/show.html.erb" do
  before(:each) do
    @allergen = assign(:allergen, stub_model(Allergen,
      :name => "Name",
      :abbr => "Abbr",
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Abbr/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
  end
end
