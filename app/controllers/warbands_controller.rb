class WarbandsController < ApplicationController

  # Helper method current_user? is needed by ensure_correct_user
  include UsersHelper

  # Make sort_column and sort_direction accesible as helper methods
  helper_method :sort_column, :sort_direction

  # Ensure that the User is signed in
  before_filter :authenticate_user!

  # Ensure that the current User is the same as the one that the warband
  # belongs to before allowing editing, updating or destroying
  before_filter :ensure_correct_user, :only => [ :edit, :update, :destroy ]
  # GET /warbands
  # GET /warbands.xml
  def index
    @title = "Warbands"
    @warbands = Warband.order(sort_column+" "+sort_direction)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @warbands }
    end
  end

  # GET /warbands/1
  # GET /warbands/1.xml
  # GET /warbands/1.json
  def show
    @warband = Warband.find(params[:id])
    @user = @warband.user
    @region = @warband.region
    @title = @warband.name

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @warband }
      format.json { render :json => @warband }
    end
  end

  # GET /warbands/new
  # GET /warbands/new.xml
  def new
    # Don't allow multiple Warbands!
    redirect_to(current_user.warband, :alert => "You already have a Warband!") and return unless current_user.warband.blank?
    @title = "New warband"
    @warband = Warband.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @warband }
    end
  end

  # GET /warbands/1/edit
  def edit
    @title = "Edit warband"
    @warband = Warband.find(params[:id])
  end

  # POST /warbands
  # POST /warbands.xml
  def create
    @warband = Warband.new(params[:warband])
    # FIXME! Set default values in model instead?
    @warband.region = Region.first
    @warband.reputation = 0
    # FIXME! Is this really the correct way?
    current_user.warband = @warband

    respond_to do |format|
      if @warband.save
        format.html { redirect_to(@warband, :notice => 'Warband was successfully created.') }
        format.xml  { render :xml => @warband, :status => :created, :location => @warband }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @warband.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /warbands/1
  # PUT /warbands/1.xml
  # PUT /warbands/1.json
  def update
    @warband = Warband.find(params[:id])

    respond_to do |format|
      if @warband.update_attributes(params[:warband])
        format.html { redirect_to(@warband, :notice => 'Warband was successfully updated.') }
        format.xml  { head :ok }
        format.json { redirect_to(@warband, :format => :json) }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @warband.errors, :status => :unprocessable_entity }
        format.json { render :json => @warband.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /warbands/1
  # DELETE /warbands/1.xml
  def destroy
    @warband = Warband.find(params[:id])
    @warband.destroy

    respond_to do |format|
      format.html { redirect_to(warbands_url) }
      format.xml  { head :ok }
    end
  end

  private

  # Ensure that the current User is the same as the one that the warband
  # belongs to
  def ensure_correct_user
    @warband = Warband.find(params[:id])
    redirect_to(user_path(current_user), :alert => "You may not perform this action on another user's Warband") unless current_user?(@warband.user)
  end

  # Get the column to order by. Possible: name, reputation. Default: name
  def sort_column
    Warband.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end

  # Get the order direction. Possible: asc, desc. Default: asc
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

end
