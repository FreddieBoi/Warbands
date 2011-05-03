class MembersController < ApplicationController

  # Helper method current_user? is needed by ensure_correct_user! method
  include UsersHelper

  # Ensure that the User is signed in
  before_filter :authenticate_user!

  # Ensure that the current User is the same as the one that the warband
  # member belongs to before allowing editing, updating or destroying
  before_filter :ensure_correct_user!, :only => [ :edit, :update, :destroy ]

  # Ensure that the current User has a Warband to add members to
  before_filter :ensure_has_warband!, :only => [:new, :create]

  # Make sort_column and sort_direction accesible as helper methods
  helper_method :sort_column, :sort_direction
  # GET /members
  # GET /members.xml
  def index
    @members = Member.search(params[:search]).order(sort_column+" "+sort_direction).paginate(:per_page => 10, :page => params[:page])
    @title = "Members"

    respond_to do |format|
      format.html # index.html.erb
      format.js # index.js.erb
      format.xml  { render :xml => @members }
    end
  end

  # GET /members/1
  # GET /members/1.xml
  def show
    @member = Member.find(params[:id])
    @warband = @member.warband
    @user = @warband.user
    @items = @member.items
    @title = @member.name

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @member }
    end
  end

  # GET /members/new
  # GET /members/new.xml
  def new
    @member = Member.new
    @title = "New member"

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @member }
    end
  end

  # GET /members/1/edit
  def edit
    @member = Member.find(params[:id])
    @title = "Edit member"
  end

  # POST /members
  # POST /members.xml
  def create
    @member = Member.new(params[:member])
    @member.warband = current_user.warband if @member.warband.blank?
    respond_to do |format|
      if @member.save
        format.html { redirect_to(@member, :notice => 'Member was successfully created.') }
        format.xml  { render :xml => @member, :status => :created, :location => @member }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @member.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /members/1
  # PUT /members/1.xml
  def update
    @member = Member.find(params[:id])

    respond_to do |format|
      if @member.update_attributes(params[:member])
        format.html { redirect_to(@member, :notice => 'Member was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @member.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /members/1
  # DELETE /members/1.xml
  def destroy
    @member = Member.find(params[:id])
    @member.destroy

    respond_to do |format|
      format.html { redirect_to(members_url) }
      format.xml  { head :ok }
    end
  end

  private

  # Ensure that the current User is the same as the one that the warband and
  # member belongs to
  def ensure_correct_user!
    @member = Member.find(params[:id])
    @user = @member.warband.user
    redirect_to(user_path(current_user), :alert => "You may not perform this action on another user's Warband member!") and return unless current_user?(@user)
  end

  # Ensure that the current User has a Warband to add members to
  def ensure_has_warband!
    redirect_to new_warband_path, :alert => "You need to create a Warband first!" and return if current_user.warband.blank?
  end

  # Get the column to order by. Default: name
  def sort_column
    Member.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end

  # Get the sort direction (order_by). Possible: asc, desc. Default: asc
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
