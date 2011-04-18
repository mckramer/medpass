require "spec_helper"

describe PrescriptionsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/prescriptions" }.should route_to(:controller => "prescriptions", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/prescriptions/new" }.should route_to(:controller => "prescriptions", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/prescriptions/1" }.should route_to(:controller => "prescriptions", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/prescriptions/1/edit" }.should route_to(:controller => "prescriptions", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/prescriptions" }.should route_to(:controller => "prescriptions", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/prescriptions/1" }.should route_to(:controller => "prescriptions", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/prescriptions/1" }.should route_to(:controller => "prescriptions", :action => "destroy", :id => "1")
    end

  end
end
