require 'spec_helper'

describe "allergies/new.html.erb" do
  before(:each) do
    assign(:allergy, stub_model(Allergy,
      :user => nil,
      :allergen => nil
    ).as_new_record)
  end

  it "renders new allergy form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => allergies_path, :method => "post" do
      assert_select "input#allergy_user", :name => "allergy[user]"
      assert_select "input#allergy_allergen", :name => "allergy[allergen]"
    end
  end
end
