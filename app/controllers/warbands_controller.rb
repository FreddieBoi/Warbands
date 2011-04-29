class WarbandsController < ApplicationController

  # Helper method current_user? is needed by ensure_correct_user
  include UsersHelper

  # Ensure that the User is signed in
  before_filter :authenticate_user!

  # Ensure that the current User is the same as the one that the warband
  # belongs to
  before_filter :ensure_correct_user, :only => [ :edit, :update, :destroy ]
  # GET /warbands
  # GET /warbands.xml
  def index
    @warbands = Warband.all

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

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @warband }
      format.json { render :json => @warband }
    end
  end

  # GET /warbands/new
  # GET /warbands/new.xml
  def new
    @warband = Warband.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @warband }
    end
  end

  # GET /warbands/1/edit
  def edit
    @warband = Warband.find(params[:id])
  end

  # POST /warbands
  # POST /warbands.xml
  def create
    @warband = Warband.new(params[:warband])

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

end
