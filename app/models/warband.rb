# == Schema Information
# Schema version: 20110430234753
#
# Table name: warbands
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  reputation :integer
#  region_id  :integer
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Warband < ActiveRecord::Base

  belongs_to :user

  belongs_to :region

  validates :name, :presence => true, :length => { :within => 2..20 },
                    :uniqueness => { :case_sensitive => false }

  has_friendly_id :name, :use_slug => true, :strip_non_ascii => true

end
