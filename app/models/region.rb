# == Schema Information
# Schema version: 20110430234753
#
# Table name: regions
#
#  id         :integer         not null, primary key
#  name       :string(255)     not null
#  pos_x      :integer
#  pos_y      :integer
#  desc       :text
#  created_at :datetime
#  updated_at :datetime
#

class Region < ActiveRecord::Base

  has_many :warbands
  
  has_many :enemies

  validates :name, :presence => true, :length => { :within => 2..20 },
                    :uniqueness => { :case_sensitive => false }

  has_friendly_id :name, :use_slug => true, :strip_non_ascii => true
  # Search for Regions matching the name of the specified search term
  def self.search(search)
    if search
      where('name LIKE ?', "%#{search}%")
    else
      scoped # Empty scope, like calling 'all' but not performing the query
    end
  end
end
