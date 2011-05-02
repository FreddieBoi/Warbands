require 'spec_helper'

describe UsersController do
    
  include Devise::TestHelpers

  render_views
  
  describe "GET 'index'" do

    describe "for non-signed-in users" do
      
      it "should deny access" do
        get :index
        response.should redirect_to(new_user_session_path)
        flash[:alert].should =~ /sign in/i
      end
      
    end
  
    pending "for signed-in users"
    
  end

  pending "check if GET for all actions works"

  pending "check for correct titles"

end
