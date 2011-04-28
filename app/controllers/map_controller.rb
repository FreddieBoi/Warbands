class MapController < ApplicationController
  
  before_filter :authenticate_user!
  
  def index
    @warband = Warband.first
    respond_to do |format|
      format.html # index.html.erb
      format.js # index.js.erb
    end
  end
  
end
