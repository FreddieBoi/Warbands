class UsersController < ApplicationController

  before_filter :authenticate_user!

  # Make sort_column and sort_direction accesible as helper methods
  helper_method :sort_column, :sort_direction
  # GET /users
  # GET /users.js
  # GET /users.xml
  def index
    @title = "Users"
    @users = User.search(params[:search]).order(sort_column+" "+sort_direction).paginate(:per_page => 10, :page => params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.js # index.js.erb
      format.xml  { render :xml => @users }
    end
  end

  def show
    @user = User.find(params[:id])
    @warband = @user.warband
    @title = @user.name
  end

  private

  # Get the column to order by. Default: name
  def sort_column
    User.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end

  # Get the sort direction (order_by). Possible: asc, desc. Default: asc
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

end
