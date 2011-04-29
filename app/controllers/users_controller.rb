class UsersController < ApplicationController

  before_filter :authenticate_user!
  
  def index
    @title = "Users"
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @warband = @user.warband
    @title = @user.name
  end

end
