# == Schema Information
# Schema version: 20110511090306
#
# Table name: enemy_templates
#
#  id         :integer         not null, primary key
#  name       :string(255)     not null
#  region_id  :integer
#  desc       :text
#  max_health :integer         default(100), not null
#  created_at :datetime
#  updated_at :datetime
#

class EnemyTemplate < ActiveRecord::Base

  # All the enemies using this template
  has_many :enemies

  belongs_to :region

  has_many :items

  # Don't allow non-ascii signs, will result in multiple enemies with same slug
  name_regex = /\A[a-z 0-9]{2,20}\z/i

  # Ensure there is a valid name
  validates :name, :presence => true, :length => { :within => 2..20 },
                    :uniqueness => { :case_sensitive => false },
                    :format => { :with => name_regex }

  # Make it possible to find and identify enemies by name
  has_friendly_id :name, :use_slug => true, :strip_non_ascii => true
  # Search for Enemies with a name matching the specified search term
  def self.search(search)
    if search
      where('name LIKE ?', "%#{search.downcase}%")
    else
      scoped # Empty scope, like calling 'all' but not performing the query
    end
  end

  def combat_value
    5
  end

end
