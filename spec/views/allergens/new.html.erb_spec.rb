require 'spec_helper'

describe "allergens/new.html.erb" do
  before(:each) do
    assign(:allergen, stub_model(Allergen,
      :name => "MyString",
      :abbr => "MyString",
      :description => "MyText"
    ).as_new_record)
  end

  it "renders new allergen form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => allergens_path, :method => "post" do
      assert_select "input#allergen_name", :name => "allergen[name]"
      assert_select "input#allergen_abbr", :name => "allergen[abbr]"
      assert_select "textarea#allergen_description", :name => "allergen[description]"
    end
  end
end
