require 'spec_helper'

describe "allergies/edit.html.erb" do
  before(:each) do
    @allergy = assign(:allergy, stub_model(Allergy,
      :user => nil,
      :allergen => nil
    ))
  end

  it "renders the edit allergy form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => allergies_path(@allergy), :method => "post" do
      assert_select "input#allergy_user", :name => "allergy[user]"
      assert_select "input#allergy_allergen", :name => "allergy[allergen]"
    end
  end
end
