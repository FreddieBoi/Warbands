class MapController < ApplicationController
  
  before_filter :authenticate_user!
  
  def index
    @warband = Warband.first
  end
  
end
