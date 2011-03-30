require 'spec_helper'

describe "allergies/show.html.erb" do
  before(:each) do
    @allergy = assign(:allergy, stub_model(Allergy,
      :user => nil,
      :allergen => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
  end
end
