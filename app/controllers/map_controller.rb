class MapController < ApplicationController

  before_filter :authenticate_user!
  def index
    if current_user.warband.blank?
      redirect_to new_warband_path, :alert => "You need to create a warband first!"
    else
      @user = current_user
      @warband = current_user.warband
      @regions = Region.all
      respond_to do |format|
        format.html # index.html.erb
      end
    end
  end

end
