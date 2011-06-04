# == Schema Information
# Schema version: 20110604123342
#
# Table name: warband_achievements
#
#  id             :integer         not null, primary key
#  warband_id     :integer
#  achievement_id :integer
#  created_at     :datetime
#  updated_at     :datetime
#

class WarbandAchievement < ActiveRecord::Base
  belongs_to :warband
  belongs_to :achievement

  # Give the Warband the reputation earned from the achievement upon creation
  after_create :update_reputation

  private
  # Give the Warband the reputation earned from the achievement
  def update_reputation
    self.warband.reputation += achievement.reputation
  end
end
