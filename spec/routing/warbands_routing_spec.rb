require "spec_helper"

describe WarbandsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/warbands" }.should route_to(:controller => "warbands", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/warbands/new" }.should route_to(:controller => "warbands", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/warbands/1" }.should route_to(:controller => "warbands", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/warbands/1/edit" }.should route_to(:controller => "warbands", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/warbands" }.should route_to(:controller => "warbands", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/warbands/1" }.should route_to(:controller => "warbands", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/warbands/1" }.should route_to(:controller => "warbands", :action => "destroy", :id => "1")
    end

  end
end
