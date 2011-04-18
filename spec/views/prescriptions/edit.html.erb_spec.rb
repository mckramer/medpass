require 'spec_helper'

describe "prescriptions/edit.html.erb" do
  before(:each) do
    @prescription = assign(:prescription, stub_model(Prescription,
      :drug => nil,
      :indication => nil,
      :dosage => nil,
      :user => nil
    ))
  end

  it "renders the edit prescription form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => prescriptions_path(@prescription), :method => "post" do
      assert_select "input#prescription_drug", :name => "prescription[drug]"
      assert_select "input#prescription_indication", :name => "prescription[indication]"
      assert_select "input#prescription_dosage", :name => "prescription[dosage]"
      assert_select "input#prescription_user", :name => "prescription[user]"
    end
  end
end
