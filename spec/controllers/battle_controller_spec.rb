require 'spec_helper'

describe BattleController do

  describe "GET 'before'" do
    it "should be successful" do
      get 'before'
      response.should be_success
    end
  end

  describe "GET 'after'" do
    it "should be successful" do
      get 'after'
      response.should be_success
    end
  end

  describe "GET 'combat'" do
    it "should be successful" do
      get 'combat'
      response.should be_success
    end
  end

end
