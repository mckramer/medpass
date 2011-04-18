require "spec_helper"

describe DosagesController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/dosages" }.should route_to(:controller => "dosages", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/dosages/new" }.should route_to(:controller => "dosages", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/dosages/1" }.should route_to(:controller => "dosages", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/dosages/1/edit" }.should route_to(:controller => "dosages", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/dosages" }.should route_to(:controller => "dosages", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/dosages/1" }.should route_to(:controller => "dosages", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/dosages/1" }.should route_to(:controller => "dosages", :action => "destroy", :id => "1")
    end

  end
end
