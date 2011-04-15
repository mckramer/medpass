require "spec_helper"

describe DrugsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/drugs" }.should route_to(:controller => "drugs", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/drugs/new" }.should route_to(:controller => "drugs", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/drugs/1" }.should route_to(:controller => "drugs", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/drugs/1/edit" }.should route_to(:controller => "drugs", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/drugs" }.should route_to(:controller => "drugs", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/drugs/1" }.should route_to(:controller => "drugs", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/drugs/1" }.should route_to(:controller => "drugs", :action => "destroy", :id => "1")
    end

  end
end
