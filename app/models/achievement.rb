# == Schema Information
# Schema version: 20110604123342
#
# Table name: achievements
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  desc       :string(255)
#  reputation :integer
#  created_at :datetime
#  updated_at :datetime
#

class Achievement < ActiveRecord::Base

  has_many :warband_achievements

  has_many :warbands, :through => :warband_achievements

  # Don't allow non-ascii signs, will result in multiple enemies with same slug
  name_regex = /\A[a-z 0-9]*\z/i

  # Ensure there is a valid name
  validates :name, :presence => true, :length => { :within => 2..30 },
                    :uniqueness => { :case_sensitive => false },
                    :format => { :with => name_regex }

  # Make it possible to find and identify Achievements by name
  has_friendly_id :name, :use_slug => true, :strip_non_ascii => true
  # Search for Achievements with a name matching the specified search term
  def self.search(search)
    if search
      where("LOWER (name) LIKE ?", "%#{search.downcase}%")
    else
      scoped # Empty scope, like calling 'all' but not performing the query
    end
  end

end
