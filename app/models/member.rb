# == Schema Information
# Schema version: 20110430234753
#
# Table name: members
#
#  id         :integer         not null, primary key
#  name       :string(255)     not null
#  level      :integer         default(0), not null
#  experience :integer         default(0), not null
#  health     :integer         default(100), not null
#  warband_id :integer
#  created_at :datetime
#  updated_at :datetime
#

class Member < ActiveRecord::Base

  belongs_to :warband

  has_many :items

  validates :name, :presence => true, :length => { :within => 2..20 },
                    :uniqueness => { :case_sensitive => false }

  has_friendly_id :name, :use_slug => true, :strip_non_ascii => true

end
