class ItemTemplatesController < ApplicationController

  # Ensure that the User is signed in
  before_filter :authenticate_user!

  # Ensure that the current User is an administrator before allowing editing,
  # updating or destroying
  before_filter :ensure_admin_user!, :except => [ :index, :show ]

  # Make sort_column and sort_direction accesible as helper methods
  helper_method :sort_column, :sort_direction
  # GET /items
  # GET /items.js
  # GET /items.xml
  def index
    @items = ItemTemplate.search(params[:search]).order(sort_column+" "+sort_direction).paginate(:per_page => 10, :page => params[:page])
    @title = "Items"

    respond_to do |format|
      format.html # index.html.erb
      format.js # index.js.erb
      format.xml  { render :xml => @items }
    end
  end

  # GET /items/1
  # GET /items/1.xml
  def show
    @item = ItemTemplate.find(params[:id])
    @title = @item.name.titleize

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @item }
    end
  end

  # GET /items/new
  # GET /items/new.xml
  def new
    @title = "New item"
    @item = ItemTemplate.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @item }
    end
  end

  # GET /items/1/edit
  def edit
    @title = "Edit item"
    @item = ItemTemplate.find(params[:id])
  end

  # POST /items
  # POST /items.xml
  def create
    @item = ItemTemplate.new(params[:item_template])

    respond_to do |format|
      if @item.save
        format.html { redirect_to(@item, :notice => 'Item was successfully created.') }
        format.xml  { render :xml => @item, :status => :created, :location => @item }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /items/1
  # PUT /items/1.xml
  def update
    @item = ItemTemplate.find(params[:id])

    respond_to do |format|
      if @item.update_attributes(params[:item_template])
        format.html { redirect_to(@item, :notice => 'Item was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.xml
  def destroy
    @item = ItemTemplate.find(params[:id])
    @item.destroy

    respond_to do |format|
      format.html { redirect_to(item_templates_url) }
      format.xml  { head :ok }
    end
  end

  private

  # Ensure that the current User is an administrator before allowing editing,
  # updating or destroying
  def ensure_admin_user!
    redirect_to(item_templates_path, :alert => "You may not perform this action on items!") and return unless current_user.admin?
  end

  # Get the column to order by. Default: name
  def sort_column
    ItemTemplate.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end

  # Get the sort direction (order_by). Possible: asc, desc. Default: asc
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

end
