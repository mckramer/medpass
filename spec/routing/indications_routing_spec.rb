require "spec_helper"

describe IndicationsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/indications" }.should route_to(:controller => "indications", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/indications/new" }.should route_to(:controller => "indications", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/indications/1" }.should route_to(:controller => "indications", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/indications/1/edit" }.should route_to(:controller => "indications", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/indications" }.should route_to(:controller => "indications", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/indications/1" }.should route_to(:controller => "indications", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/indications/1" }.should route_to(:controller => "indications", :action => "destroy", :id => "1")
    end

  end
end
