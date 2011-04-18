require 'spec_helper'

describe "prescriptions/new.html.erb" do
  before(:each) do
    assign(:prescription, stub_model(Prescription,
      :drug => nil,
      :indication => nil,
      :dosage => nil,
      :user => nil
    ).as_new_record)
  end

  it "renders new prescription form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => prescriptions_path, :method => "post" do
      assert_select "input#prescription_drug", :name => "prescription[drug]"
      assert_select "input#prescription_indication", :name => "prescription[indication]"
      assert_select "input#prescription_dosage", :name => "prescription[dosage]"
      assert_select "input#prescription_user", :name => "prescription[user]"
    end
  end
end
