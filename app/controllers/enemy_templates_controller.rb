class EnemyTemplatesController < ApplicationController

  # Ensure that the User is signed in
  before_filter :authenticate_user!

  # Ensure that the current User is an administrator before allowing editing,
  # updating or destroying
  before_filter :ensure_admin_user!, :except => [ :index, :show ]

  # Make sort_column and sort_direction accesible as helper methods
  helper_method :sort_column, :sort_direction
  # GET /enemies
  # GET /enemies.js
  # GET /enemies.xml
  def index
    @enemies = EnemyTemplate.search(params[:search]).order(sort_column+" "+sort_direction).paginate(:per_page => 10, :page => params[:page])
    @title = "Enemies"

    respond_to do |format|
      format.html # index.html.erb
      format.js # index.js.erb
      format.xml  { render :xml => @enemies }
    end
  end

  # GET /enemies/1
  # GET /enemies/1.xml
  def show
    @enemy = EnemyTemplate.find(params[:id])
    @title = @enemy.name.titleize
    @region = @enemy.region
    @items = @enemy.item_templates

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @enemy }
    end
  end

  # GET /enemies/new
  # GET /enemies/new.xml
  def new
    @enemy = EnemyTemplate.new
    @title = "New enemy"

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @enemy }
    end
  end

  # GET /enemies/1/edit
  def edit
    @enemy = EnemyTemplate.find(params[:id])
    @title = "Edit enemy"
  end

  # POST /enemies
  # POST /enemies.xml
  def create
    @enemy = EnemyTemplate.new(params[:enemy_template])
    @enemy.region = Region.find(params[:enemy_template][:region_id])

    respond_to do |format|
      if @enemy.save
        format.html { redirect_to(@enemy, :notice => 'Enemy was successfully created.') }
        format.xml  { render :xml => @enemy, :status => :created, :location => @enemy }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @enemy.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /enemies/1
  # PUT /enemies/1.xml
  def update
    @enemy = EnemyTemplate.find(params[:id])

    respond_to do |format|
      if @enemy.update_attributes(params[:enemy_template])
        format.html { redirect_to(@enemy, :notice => 'Enemy was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @enemy.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /enemies/1
  # DELETE /enemies/1.xml
  def destroy
    @enemy = EnemyTemplate.find(params[:id])
    @enemy.destroy

    respond_to do |format|
      format.html { redirect_to(enemies_url) }
      format.xml  { head :ok }
    end
  end

  private

  # Ensure that the current User is an administrator before allowing editing,
  # updating or destroying
  def ensure_admin_user!
    redirect_to(enemy_templates_path, :alert => "You may not perform this action on Enemies!") and return unless current_user.admin?
  end

  # Get the column to order by. Default: name
  def sort_column
    Item.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end

  # Get the sort direction (order_by). Possible: asc, desc. Default: asc
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

end
