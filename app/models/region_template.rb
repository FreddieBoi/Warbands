# == Schema Information
# Schema version: 20110525164811
#
# Table name: region_templates
#
#  id                :integer         not null, primary key
#  name              :string(255)     not null
#  pos_x             :integer         default(0), not null
#  pos_y             :integer         default(0), not null
#  desc              :text
#  world_template_id :integer
#  created_at        :datetime
#  updated_at        :datetime
#

class RegionTemplate < ActiveRecord::Base

  # All the regions using this template
  has_many :regions

  has_many :enemy_templates
  
  belongs_to :world_template

  # Don't allow non-ascii signs, might result in multiple regions with same slug
  name_regex = /\A[a-z 0-9]{2,20}\z/i

  # Ensure there is a valid name
  validates :name, :presence => true, :length => { :within => 2..20 },
                    :uniqueness => { :case_sensitive => false },
                    :format => { :with => name_regex }

  # Make it possible to find and identify regions by name
  has_friendly_id :name, :use_slug => true, :strip_non_ascii => true
  # Search for Regions matching the name of the specified search term
  def self.search(search)
    if search
      where("LOWER (name) LIKE ?", "%#{search.downcase}%")
    else
      scoped # Empty scope, like calling 'all' but not performing the query
    end
  end

end
