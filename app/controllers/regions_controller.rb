class RegionsController < ApplicationController

  # Ensure that the User is signed in
  before_filter :authenticate_user!

  # Ensure that the current User is an administrator before allowing editing,
  # updating or destroying
  before_filter :ensure_admin_user, :only => [ :edit, :update, :destroy ]
  # GET /regions
  # GET /regions.xml
  def index
    @title = "Regions"
    @regions = Region.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @regions }
    end
  end

  # GET /regions/1
  # GET /regions/1.xml
  def show
    @region = Region.find(params[:id])
    @title = @region.name

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @region }
    end
  end

  # GET /regions/new
  # GET /regions/new.xml
  def new
    @title = "New region"
    @region = Region.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @region }
    end
  end

  # GET /regions/1/edit
  def edit
    @title = "Edit region"
    @region = Region.find(params[:id])
  end

  # POST /regions
  # POST /regions.xml
  def create
    @region = Region.new(params[:region])

    respond_to do |format|
      if @region.save
        format.html { redirect_to(@region, :notice => 'Region was successfully created.') }
        format.xml  { render :xml => @region, :status => :created, :location => @region }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @region.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /regions/1
  # PUT /regions/1.xml
  def update
    @region = Region.find(params[:id])

    respond_to do |format|
      if @region.update_attributes(params[:region])
        format.html { redirect_to(@region, :notice => 'Region was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @region.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /regions/1
  # DELETE /regions/1.xml
  def destroy
    @region = Region.find(params[:id])
    @region.destroy

    respond_to do |format|
      format.html { redirect_to(regions_url) }
      format.xml  { head :ok }
    end
  end

  private

  # Ensure that the current User is an administrator before allowing editing,
  # updating or destroying
  def ensure_admin_user
    redirect_to(regions_path, :alert => "You may not perform this action on Regions!") unless current_user.admin?
  end

end