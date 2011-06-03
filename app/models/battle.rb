# == Schema Information
# Schema version: 20110603071110
#
# Table name: battles
#
#  id         :integer         not null, primary key
#  outcome    :string(255)     not null
#  enemy_id   :integer
#  warband_id :integer
#  region_id  :integer
#  created_at :datetime
#  updated_at :datetime
#

class Battle < ActiveRecord::Base
  belongs_to :enemy
  belongs_to :warband
  belongs_to :region

  attr_accessible :enemy, :warband, :outcome

  validates :enemy, :presence => true
  validates :warband, :presence => true
  def resolve
    casualties = 0
    warband.members.each do |member|
      if member.health <= 0
      casualties += 1
      end
    end
    while true
      warband.members.each do |member|
        if enemy.health <= 0
          
          enemy.destroy
          self.outcome = "win"
          return
        end
        if member.health <= 0
          casualties += 1
        end
        if casualties >= warband.members.count
          self.outcome = "defeat"
          return
        end

        enemy.health -= member.combat_value #member hits enemy
        member.health -= enemy.combat_value #enemy hits warband

        enemy.save
        member.save
      end
    end
  end
end
