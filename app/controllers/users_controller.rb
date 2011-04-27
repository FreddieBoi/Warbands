class UsersController < ApplicationController
  def index
    @title = "Users"
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @title = @user.name
  end

end
