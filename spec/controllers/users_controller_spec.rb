require 'spec_helper'

describe UsersController do

  describe "GET 'index'" do
    it "should be successful" do
      get :index
      response.should be_success
    end
  end
  
  pending "add GET 'show' test"
  
  pending "check for correct titles"

end
