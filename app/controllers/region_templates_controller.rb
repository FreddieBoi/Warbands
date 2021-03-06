class RegionTemplatesController < ApplicationController

  # Ensure that the User is signed in
  before_filter :authenticate_user!

  # Ensure that the current User is an administrator before allowing editing,
  # updating or destroying
  before_filter :ensure_admin_user!, :except => [ :index, :show ]

  # Make sort_column and sort_direction accesible as helper methods
  helper_method :sort_column, :sort_direction
  # GET /regions
  # GET /regions.js
  # GET /regions.xml
  def index
    @title = "Regions"
    @regions = RegionTemplate.search(params[:search]).order(sort_column+" "+sort_direction).paginate(:per_page => 10, :page => params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.js # index.js.erb
      format.xml  { render :xml => @regions }
    end
  end

  # GET /regions/1
  # GET /regions/1.xml
  def show
    @region = RegionTemplate.find(params[:id])
    @title = @region.name.titleize

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @region }
    end
  end

  # GET /regions/new
  # GET /regions/new.xml
  def new
    @title = "New region"
    @region = RegionTemplate.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @region }
    end
  end

  # GET /regions/1/edit
  def edit
    @title = "Edit region"
    @region = RegionTemplate.find(params[:id])
  end

  # POST /regions
  # POST /regions.xml
  def create
    @region = RegionTemplate.new(params[:region_template])

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
    @region = RegionTemplate.find(params[:id])

    respond_to do |format|
      if @region.update_attributes(params[:region_template])
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
    @region = RegionTemplate.find(params[:id])
    @region.destroy

    respond_to do |format|
      format.html { redirect_to(region_templates_url) }
      format.xml  { head :ok }
    end
  end

  private

  # Ensure that the current User is an administrator before allowing editing,
  # updating or destroying
  def ensure_admin_user!
    redirect_to(region_templates_path, :alert => "You may not perform this action on regions!") and return unless current_user.admin?
  end

  # Get the column to order by. Default: name
  def sort_column
    RegionTemplate.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end

  # Get the sort direction (order_by). Possible: asc, desc. Default: asc
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

end
