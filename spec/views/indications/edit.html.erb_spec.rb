require 'spec_helper'

describe "indications/edit.html.erb" do
  before(:each) do
    @indication = assign(:indication, stub_model(Indication,
      :text => "MyString",
      :description => "MyText",
      :drug => nil
    ))
  end

  it "renders the edit indication form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => indications_path(@indication), :method => "post" do
      assert_select "input#indication_text", :name => "indication[text]"
      assert_select "textarea#indication_description", :name => "indication[description]"
      assert_select "input#indication_drug", :name => "indication[drug]"
    end
  end
end
