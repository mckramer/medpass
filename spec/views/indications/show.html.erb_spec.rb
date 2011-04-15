require 'spec_helper'

describe "indications/show.html.erb" do
  before(:each) do
    @indication = assign(:indication, stub_model(Indication,
      :text => "Text",
      :description => "MyText",
      :drug => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Text/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
  end
end
