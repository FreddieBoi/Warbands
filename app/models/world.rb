class World < ActiveRecord::Base
  has_many :regions
  has_many :battles
  has_one :warband
  belongs_to :user
end
