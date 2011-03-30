require 'spec_helper'

describe "conditions/new.html.erb" do
  before(:each) do
    assign(:condition, stub_model(Condition,
      :name => "MyString",
      :abbr => "MyString",
      :description => "MyText",
      :icd9 => "MyString"
    ).as_new_record)
  end

  it "renders new condition form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => conditions_path, :method => "post" do
      assert_select "input#condition_name", :name => "condition[name]"
      assert_select "input#condition_abbr", :name => "condition[abbr]"
      assert_select "textarea#condition_description", :name => "condition[description]"
      assert_select "input#condition_icd9", :name => "condition[icd9]"
    end
  end
end
