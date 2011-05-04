class NewsController < ApplicationController

  # Ensure that the User is signed in except for index and show actions
  before_filter :authenticate_user!, :except => [ :index, :show ]

  # Ensure that the current User is an administrator before allowing editing,
  # updating or destroying
  before_filter :ensure_admin_user!, :except => [ :index, :show ]

  # Make sort_column and sort_direction accesible as helper methods
  helper_method :sort_column, :sort_direction
  # GET /news
  # GET /news.xml
  def index
    @news = News.search(params[:search]).order(sort_column+" "+sort_direction).paginate(:per_page => 10, :page => params[:page])
    @title = "News"

    respond_to do |format|
      format.html # index.html.erb
      format.js # index.js.erb
      format.xml  { render :xml => @news }
    end
  end

  # GET /news/1
  # GET /news/1.xml
  def show
    @news = News.find(params[:id])
    @title = @news.title.titleize
    @user = @news.user

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @news }
    end
  end

  # GET /news/new
  # GET /news/new.xml
  def new
    @news = News.new
    @title = "New news"

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @news }
    end
  end

  # GET /news/1/edit
  def edit
    @news = News.find(params[:id])
    @title = "Edit news"
  end

  # POST /news
  # POST /news.xml
  def create
    @news = News.new(params[:news])
    @news.user = current_user

    respond_to do |format|
      if @news.save
        format.html { redirect_to(@news, :notice => 'News was successfully created.') }
        format.xml  { render :xml => @news, :status => :created, :location => @news }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @news.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /news/1
  # PUT /news/1.xml
  def update
    @news = News.find(params[:id])

    respond_to do |format|
      if @news.update_attributes(params[:news])
        format.html { redirect_to(@news, :notice => 'News was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @news.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /news/1
  # DELETE /news/1.xml
  def destroy
    @news = News.find(params[:id])
    @news.destroy

    respond_to do |format|
      format.html { redirect_to(news_index_url) }
      format.xml  { head :ok }
    end
  end

  private

  # Ensure that the current User is an administrator before allowing editing,
  # updating or destroying
  def ensure_admin_user!
    redirect_to(news_path, :alert => "You may not perform this action on News!") and return unless user_signed_in? && current_user.admin?
  end

  # Get the column to order by. Default: created_at
  def sort_column
    News.column_names.include?(params[:sort]) ? params[:sort] : "created_at"
  end

  # Get the sort direction (order_by). Possible: asc, desc. Default: asc
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
  end
end
