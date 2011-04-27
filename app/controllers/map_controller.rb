class MapController < ApplicationController
  
  def index
    @warband = Warband.first
  end
  
end
