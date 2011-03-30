require "spec_helper"

describe AllergensController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/allergens" }.should route_to(:controller => "allergens", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/allergens/new" }.should route_to(:controller => "allergens", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/allergens/1" }.should route_to(:controller => "allergens", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/allergens/1/edit" }.should route_to(:controller => "allergens", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/allergens" }.should route_to(:controller => "allergens", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/allergens/1" }.should route_to(:controller => "allergens", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/allergens/1" }.should route_to(:controller => "allergens", :action => "destroy", :id => "1")
    end

  end
end
