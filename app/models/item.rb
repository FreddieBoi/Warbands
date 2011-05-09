# == Schema Information
# Schema version: 20110509113610
#
# Table name: items
#
#  id         :integer         not null, primary key
#  name       :string(255)     not null
#  desc       :text
#  cost       :integer         default(0), not null
#  item_type  :string(255)
#  member_id  :integer
#  enemy_id   :integer
#  created_at :datetime
#  updated_at :datetime
#

class Item < ActiveRecord::Base

  belongs_to :member

  belongs_to :enemy

  validates :name, :presence => true, :length => { :within => 2..20 },
                    :uniqueness => { :case_sensitive => false }

  has_friendly_id :name, :use_slug => true, :strip_non_ascii => true
  # Search for Items matching the name of the specified search term
  def self.search(search)
    if search
      where('name LIKE ?', "%#{search}%")
    else
      scoped # Empty scope, like calling 'all' but not performing the query
    end
  end
end
