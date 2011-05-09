class EnemiesController < ApplicationController
  # GET /enemies
  # GET /enemies.xml
  def index
    @enemies = Enemy.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @enemies }
    end
  end

  # GET /enemies/1
  # GET /enemies/1.xml
  def show
    @enemy = Enemy.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @enemy }
    end
  end

  # GET /enemies/new
  # GET /enemies/new.xml
  def new
    @enemy = Enemy.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @enemy }
    end
  end

  # GET /enemies/1/edit
  def edit
    @enemy = Enemy.find(params[:id])
  end

  # POST /enemies
  # POST /enemies.xml
  def create
    @enemy = Enemy.new(params[:enemy])
    @enemy.region = Region.find(params[:enemy][:region_id])

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
    @enemy = Enemy.find(params[:id])

    respond_to do |format|
      if @enemy.update_attributes(params[:enemy])
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
    @enemy = Enemy.find(params[:id])
    @enemy.destroy

    respond_to do |format|
      format.html { redirect_to(enemies_url) }
      format.xml  { head :ok }
    end
  end
end
