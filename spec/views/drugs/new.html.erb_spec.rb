require 'spec_helper'

describe "drugs/new.html.erb" do
  before(:each) do
    assign(:drug, stub_model(Drug,
      :name => "MyString",
      :abbr => "MyString",
      :description => "MyText",
      :parent_id => 1
    ).as_new_record)
  end

  it "renders new drug form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => drugs_path, :method => "post" do
      assert_select "input#drug_name", :name => "drug[name]"
      assert_select "input#drug_abbr", :name => "drug[abbr]"
      assert_select "textarea#drug_description", :name => "drug[description]"
      assert_select "input#drug_parent_id", :name => "drug[parent_id]"
    end
  end
end
