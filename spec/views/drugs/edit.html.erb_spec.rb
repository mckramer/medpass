require 'spec_helper'

describe "drugs/edit.html.erb" do
  before(:each) do
    @drug = assign(:drug, stub_model(Drug,
      :name => "MyString",
      :abbr => "MyString",
      :description => "MyText",
      :parent_id => 1
    ))
  end

  it "renders the edit drug form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => drugs_path(@drug), :method => "post" do
      assert_select "input#drug_name", :name => "drug[name]"
      assert_select "input#drug_abbr", :name => "drug[abbr]"
      assert_select "textarea#drug_description", :name => "drug[description]"
      assert_select "input#drug_parent_id", :name => "drug[parent_id]"
    end
  end
end
