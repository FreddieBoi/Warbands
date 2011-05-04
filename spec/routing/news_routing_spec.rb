require "spec_helper"

describe NewsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/news" }.should route_to(:controller => "news", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/news/new" }.should route_to(:controller => "news", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/news/1" }.should route_to(:controller => "news", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/news/1/edit" }.should route_to(:controller => "news", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/news" }.should route_to(:controller => "news", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/news/1" }.should route_to(:controller => "news", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/news/1" }.should route_to(:controller => "news", :action => "destroy", :id => "1")
    end

  end
end
