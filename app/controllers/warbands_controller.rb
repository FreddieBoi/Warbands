class WarbandsController < ApplicationController
  
  before_filter :authenticate_user!
  
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
  def show
    @warband = Warband.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @warband }
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
  def update
    @warband = Warband.find(params[:id])

    respond_to do |format|
      if @warband.update_attributes(params[:warband])
        format.html { redirect_to(@warband, :notice => 'Warband was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @warband.errors, :status => :unprocessable_entity }
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
end
