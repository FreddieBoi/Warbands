require "spec_helper"

describe EnemiesController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/enemies" }.should route_to(:controller => "enemies", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/enemies/new" }.should route_to(:controller => "enemies", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/enemies/1" }.should route_to(:controller => "enemies", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/enemies/1/edit" }.should route_to(:controller => "enemies", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/enemies" }.should route_to(:controller => "enemies", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/enemies/1" }.should route_to(:controller => "enemies", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/enemies/1" }.should route_to(:controller => "enemies", :action => "destroy", :id => "1")
    end

  end
end
