require 'spec_helper'

describe "conditions/show.html.erb" do
  before(:each) do
    @condition = assign(:condition, stub_model(Condition,
      :name => "Name",
      :abbr => "Abbr",
      :description => "MyText",
      :icd9 => "Icd9"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Abbr/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Icd9/)
  end
end
