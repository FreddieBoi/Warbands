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

  # GET /battle/combat
  def combat
    @title = "The battle is waging!"
    @warband = current_user.warband
    @enemy = Enemy.find(params[:enemy_id])
    @battle = Battle.create!(:warband => @warband, :enemy => @enemy, :outcome => "ongoing")
    @item_ids = @enemy.items.map { |i| i.id }
    @battle.resolve
    @warband.members.map { |m| m.save! }
    @battle.save

    redirect_to(:action => :after, :battle_id => @battle.id, :item_ids => @item_ids)
  end

  # GET /battle/after
  def after
    @title = "Battle report"
    @battle = Battle.find(params[:battle_id])
    @win = @battle.outcome == "win"
    @warband = current_user.warband

    if @win
      # Any achievements completed?
      if not @warband.achievements.include? Achievement.where(:name => "Blood lust").first
        @achievement = Achievement.where(:name => "Blood lust").first
        WarbandAchievement.create!(:warband => @warband, :achievement => @achievement)
      elsif @battle.enemy_template.name == "Sand Archer"
        @achievement = Achievement.where(:name => "Sandy killer").first
        WarbandAchievement.create!(:warband => @warband, :achievement => @achievement)
      end
      flash.now[:notice] = "Achievement completed: "+@achievement.name unless @achievement.blank?
      
      # Any items obtained?
      @items = []
      params[:item_ids].each do |i|
        item = Item.find(i)
        item.warband = @warband
        item.save
        @items.push(item)
      end
    end

    respond_to do |format|
      format.html # after.html.erb
    end
  end

end
