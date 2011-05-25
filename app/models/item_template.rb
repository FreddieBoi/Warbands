# == Schema Information
# Schema version: 20110524170448
#
# Table name: item_templates
#
#  id                :integer         not null, primary key
#  name              :string(255)     not null
#  desc              :text
#  cost              :integer         default(0), not null
#  item_type         :string(255)
#  combat_value      :integer         default(0), not null
#  enemy_template_id :integer
#  created_at        :datetime
#  updated_at        :datetime
#

class ItemTemplate < ActiveRecord::Base

  # An item template could belong to an enemy template
  belongs_to :enemy_template
  
  # All the items using this template
  has_many :items

  # Don't allow non-ascii signs (avoid multiple items with same slug)
  name_regex = /\A[a-z 0-9]{2,20}\z/i

  # Ensure there is a valid name
  validates :name, :presence => true, :length => { :within => 2..20 },
                    :uniqueness => { :case_sensitive => false },
                    :format => { :with => name_regex }

  # Make it possible to find and identify items by name
  has_friendly_id :name, :use_slug => true, :strip_non_ascii => true
  # Search for Items matching the name of the specified search term
  def self.search(search)
    if search
      where('name LIKE ?', "%#{search.downcase}%")
    else
      scoped # Empty scope, like calling 'all' but not performing the query
    end
  end

end
