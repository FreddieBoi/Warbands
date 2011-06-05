class AchievementsController < ApplicationController

  # Ensure that the User is signed in
  before_filter :authenticate_user!

  # Ensure that the current User is an administrator before allowing editing,
  # updating or destroying
  before_filter :ensure_admin_user!, :except => [ :index, :show ]

  # Make sort_column and sort_direction accesible as helper methods
  helper_method :sort_column, :sort_direction
  # GET /achievements
  # GET /achievements.js
  # GET /achievements.xml
  def index
    @title = "Achievements"
    @achievements = Achievement.search(params[:search]).order(sort_column+" "+sort_direction).paginate(:per_page => 10, :page => params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.js # index.js.erb
      format.xml  { render :xml => @achievements }
    end
  end

  # GET /achievements/1
  # GET /achievements/1.xml
  def show
    @achievement = Achievement.find(params[:id])
    @title = @achievement.name

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @achievement }
    end
  end

  # GET /achievements/new
  # GET /achievements/new.xml
  def new
    @title = "New achievement"
    @achievement = Achievement.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @achievement }
    end
  end

  # GET /achievements/1/edit
  def edit
    @title = "Edit achievement"
    @achievement = Achievement.find(params[:id])
  end

  # POST /achievements
  # POST /achievements.xml
  def create
    @achievement = Achievement.new(params[:achievement])

    respond_to do |format|
      if @achievement.save
        format.html { redirect_to(@achievement, :notice => 'Achievement was successfully created.') }
        format.xml  { render :xml => @achievement, :status => :created, :location => @achievement }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @achievement.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /achievements/1
  # PUT /achievements/1.xml
  def update
    @achievement = Achievement.find(params[:id])

    respond_to do |format|
      if @achievement.update_attributes(params[:achievement])
        format.html { redirect_to(@achievement, :notice => 'Achievement was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @achievement.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /achievements/1
  # DELETE /achievements/1.xml
  def destroy
    @achievement = Achievement.find(params[:id])
    @achievement.destroy

    respond_to do |format|
      format.html { redirect_to(achievements_url) }
      format.xml  { head :ok }
    end
  end

  private

  # Ensure that the current User is an administrator before allowing editing,
  # updating or destroying
  def ensure_admin_user!
    redirect_to(achievements_path, :alert => "You may not perform this action on achievements!") and return unless current_user.admin?
  end

  # Get the column to order by. Default: name
  def sort_column
    Achievement.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end

  # Get the sort direction (order_by). Possible: asc, desc. Default: asc
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

end
