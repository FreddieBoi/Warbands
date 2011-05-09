class Enemy < ActiveRecord::Base
  belongs_to :region
  
  has_many :items
  
  validates :name, :presence => true, :length => { :within => 2..20 },
                    :uniqueness => { :case_sensitive => false }

  has_friendly_id :name, :use_slug => true, :strip_non_ascii => true
end
