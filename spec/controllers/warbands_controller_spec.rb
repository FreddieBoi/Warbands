require 'spec_helper'

describe WarbandsController do

  include Devise::TestHelpers

  render_views

  before(:each) do
    @user = Factory(:user)
    sign_in @user
  end

  def mock_warband(stubs={})
    @mock_warband ||= mock_model(Warband, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all warbands as @warbands" do
      Warband.stub(:all) { [mock_warband] }
      get :index
      assigns(:warbands).should eq([mock_warband])
    end
  end

  describe "GET show" do
    it "assigns the requested warband as @warband" do
      Warband.stub(:find).with("37") { mock_warband }
      get :show, :id => "37"
      assigns(:warband).should be(mock_warband)
    end
  end

  describe "GET new" do
    it "assigns a new warband as @warband" do
      Warband.stub(:new) { mock_warband }
      get :new
      assigns(:warband).should be(mock_warband)
    end
  end

  describe "GET edit" do
    it "assigns the requested warband as @warband" do
      Warband.stub(:find).with("37") { mock_warband }
      get :edit, :id => "37"
      assigns(:warband).should be(mock_warband)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "assigns a newly created warband as @warband" do
        Warband.stub(:new).with({'these' => 'params'}) { mock_warband(:save => true) }
        post :create, :warband => {'these' => 'params'}
        assigns(:warband).should be(mock_warband)
      end

      it "redirects to the created warband" do
        Warband.stub(:new) { mock_warband(:save => true) }
        post :create, :warband => {}
        response.should redirect_to(warband_url(mock_warband))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved warband as @warband" do
        Warband.stub(:new).with({'these' => 'params'}) { mock_warband(:save => false) }
        post :create, :warband => {'these' => 'params'}
        assigns(:warband).should be(mock_warband)
      end

      it "re-renders the 'new' template" do
        Warband.stub(:new) { mock_warband(:save => false) }
        post :create, :warband => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested warband" do
        Warband.stub(:find).with("37") { mock_warband }
        mock_warband.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :warband => {'these' => 'params'}
      end

      it "assigns the requested warband as @warband" do
        Warband.stub(:find) { mock_warband(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:warband).should be(mock_warband)
      end

      it "redirects to the user" do
        Warband.stub(:find) { mock_warband(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(user_url(@user))
      end
    end

    describe "with invalid params" do
      it "assigns the warband as @warband" do
        Warband.stub(:find) { mock_warband(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:warband).should be(mock_warband)
      end

      it "re-renders the 'edit' template" do
        Warband.stub(:find) { mock_warband(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested warband" do
      Warband.stub(:find).with("37") { mock_warband }
      mock_warband.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the user" do
      Warband.stub(:find) { mock_warband }
      delete :destroy, :id => "1"
      response.should redirect_to(user_url(@user))
    end
  end

end
