# == Schema Information
# Schema version: 20110603071110
#
# Table name: battles
#
#  id                 :integer         not null, primary key
#  outcome            :string(255)     not null
#  enemy_id           :integer
#  enemy_template_id  :integer
#  warband_id         :integer
#  region_id          :integer
#  region_template_id :integer
#  created_at         :datetime
#  updated_at         :datetime
#

class Battle < ActiveRecord::Base
  belongs_to :enemy
  belongs_to :warband
  belongs_to :region
  belongs_to :region_template
  belongs_to :enemy_template

  attr_accessible :enemy, :warband, :outcome

  validates :enemy, :presence => true
  validates :warband, :presence => true
  
  before_save :initialize_battle
  
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
          enemy.save!
          self.outcome = "defeat"
          return
        end

        enemy.health -= member.combat_value # member hits enemy
        member.health -= enemy.combat_value # enemy hits warband
        member.experience += 1;
      end
    end
  end
  
  private 
  
  def initialize_battle
    unless enemy.blank? && enemy.template.blank?
      self.enemy_template = enemy.template
      self.region = enemy.region
      self.region_template = enemy.region.template
    end
  end
end
