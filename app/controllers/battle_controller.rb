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
    @battle = Battle.create(:warband => @warband, :enemy => @enemy, :outcome => "ongoing")
    @item_ids = @enemy.items.map { |i| i.id }
    @battle.resolve
    @battle.save
    
    redirect_to(:action => :after, :battle_id => @battle.id, :item_ids => @item_ids)
  end

  def after
    @battle = Battle.find(params[:battle_id])
    @win = @battle.outcome == "win"
    @items = []
    params[:item_ids].each do |i|
      @items.push(Item.find(i))
    end
    respond_to do |format|
      format.html # after.html.erb
    end
  end

end
