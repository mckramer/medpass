require 'spec_helper'

describe "dosages/new.html.erb" do
  before(:each) do
    assign(:dosage, stub_model(Dosage,
      :units => "MyString",
      :strength => 1,
      :dose => 1,
      :frequency => 1,
      :form => "MyString",
      :route => "MyString",
      :drug => nil
    ).as_new_record)
  end

  it "renders new dosage form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => dosages_path, :method => "post" do
      assert_select "input#dosage_units", :name => "dosage[units]"
      assert_select "input#dosage_strength", :name => "dosage[strength]"
      assert_select "input#dosage_dose", :name => "dosage[dose]"
      assert_select "input#dosage_frequency", :name => "dosage[frequency]"
      assert_select "input#dosage_form", :name => "dosage[form]"
      assert_select "input#dosage_route", :name => "dosage[route]"
      assert_select "input#dosage_drug", :name => "dosage[drug]"
    end
  end
end
