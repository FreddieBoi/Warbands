require 'test_helper'

class WarbandsControllerTest < ActionController::TestCase
  setup do
    @warband = warbands(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:warbands)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create warband" do
    assert_difference('Warband.count') do
      post :create, :warband => @warband.attributes
    end

    assert_redirected_to warband_path(assigns(:warband))
  end

  test "should show warband" do
    get :show, :id => @warband.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @warband.to_param
    assert_response :success
  end

  test "should update warband" do
    put :update, :id => @warband.to_param, :warband => @warband.attributes
    assert_redirected_to warband_path(assigns(:warband))
  end

  test "should destroy warband" do
    assert_difference('Warband.count', -1) do
      delete :destroy, :id => @warband.to_param
    end

    assert_redirected_to warbands_path
  end
end
