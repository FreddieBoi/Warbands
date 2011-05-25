# == Schema Information
# Schema version: 20110511090306
#
# Table name: worlds
#
#  id         :integer         not null, primary key
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class World < ActiveRecord::Base

  # A world consist of a lot of regions.
  has_many :regions

  # List all battles.
  has_many :battles

  # A warband belongs to a user through a world.
  has_one :warband

  # The world belongs to a user.
  belongs_to :user

end
