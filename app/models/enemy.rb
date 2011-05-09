# == Schema Information
# Schema version: 20110509113610
#
# Table name: enemies
#
#  id         :integer         not null, primary key
#  name       :string(255)     not null
#  region_id  :integer
#  desc       :text
#  health     :integer         default(100), not null
#  max_health :integer         default(100), not null
#  created_at :datetime
#  updated_at :datetime
#

class Enemy < ActiveRecord::Base
  belongs_to :region

  has_many :items

  validates :name, :presence => true, :length => { :within => 2..20 },
                    :uniqueness => { :case_sensitive => false }

  has_friendly_id :name, :use_slug => true, :strip_non_ascii => true
  # Search for Enemies with a name matching the specified search term
  def self.search(search)
    if search
      where('name LIKE ?', "%#{search.downcase}%")
    else
      scoped # Empty scope, like calling 'all' but not performing the query
    end
  end
end
