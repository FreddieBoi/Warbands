class BattleController < ApplicationController

  # Ensure that the User is signed in
  before_filter :authenticate_user!
  # GET /battle/before
  def before
    @title = "Prepare for battle!"
    @warband = current_user.warband
    @enemy = Enemy.find(params[:enemy_id])
    respond_to do |format|
      format.html # before.html.erb
    end
  end

  def combat
    @title = "The battle is waging!"
    @warband = current_user.warband
    @enemy = Enemy.find(params[:enemy_id])
    
    respond_to do |format|
      format.html # combat.html.erb
    end
  end

  def after
  end

end
