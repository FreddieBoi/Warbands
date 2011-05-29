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
    
    @winner = resolveCombat(@warband, @enemy)
    
    respond_to do |format|
      format.html # combat.html.erb
    end
  end

  def after
  end

	def resolveCombat(warband, enemy)
		casualties = 0
		while true
			warband.members.each_with_index do |member, index|
				enemy.health =- member.combat_value
				member.health =- enemy.combat_value
				
				if enemy.health <= 0
					return warband
				end
				if member.health <= 0
					casualties += 1
				end
				if casualties >= warband.members.length
					return enemy
				end
			end
		end
	end

end
