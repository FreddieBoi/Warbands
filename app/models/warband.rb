# == Schema Information
# Schema version: 20110511090306
#
# Table name: warbands
#
#  id         :integer         not null, primary key
#  name       :string(255)     not null
#  reputation :integer         default(0), not null
#  region_id  :integer
#  world_id   :integer
#  created_at :datetime
#  updated_at :datetime
#

class Warband < ActiveRecord::Base

  # The warband consist of 0 to max_member_count members
  has_many :members, :dependent => :destroy

  has_many :battles, :dependent => :destroy

  has_many :warband_achievements
  has_many :achievements, :through => :warband_achievements

  has_many :items

  # Make it possible to update members through their warband.
  accepts_nested_attributes_for :members

  belongs_to :world

  belongs_to :region

  # Don't allow non-ascii signs, will result in multiple warbands with same slug
  name_regex = /\A[a-z 0-9]*\z/i

  # Ensure there is a valid name
  validates :name, :presence => true, :length => { :within => 2..20 },
                    :uniqueness => { :case_sensitive => false },
                    :format => { :with => name_regex }

  # Make it possible to find and identify warbands by name
  has_friendly_id :name, :use_slug => true, :strip_non_ascii => true
  def user
    world.user
  end

  # Search for Warbands matching the name of the specified search term
  def self.search(search)
    if search
      where("LOWER (name) LIKE ?", "%#{search.downcase}%")
    else
      scoped # Empty scope, like calling 'all' but not performing the query
    end
  end

  # Get the maximum number of members allowed
  def max_member_count
    5
  end

  def combat_value
    value = 0
    members.each do |member|
      value += member.combat_value
    end
    value
  end

  def get_member_with_lowest_combat_value
    lowest_combat_value = 1000 # should be infinity
    member = nil
    members.each do |m|
      if m.combat_value < lowest_combat_value
      lowest_combat_value = m.combat_value
      member = m
      end
    end
    return member
  end

end
