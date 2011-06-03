# == Schema Information
# Schema version: 20110603071110
#
# Table name: worlds
#
#  id                :integer         not null, primary key
#  user_id           :integer         not null
#  world_template_id :integer         not null
#  created_at        :datetime
#  updated_at        :datetime
#

class World < ActiveRecord::Base

  attr_accessible :world_template, :user

  # The template the region is an instance of
  belongs_to :world_template

  # A world consist of a lot of regions.
  has_many :regions

  # List of all the battles.
  has_many :battles

  # The world belongs to a user.
  belongs_to :user

  # A warband belongs to a user through a world.
  has_one :warband

  validates :world_template, :presence => true
  validates :user, :presence => true

  # Create associated regions upon creation
  after_create :create_regions
  # Get the template
  def template
    world_template
  end

  def name
    template.name
  end

  def starting_items
    template.item_templates
  end

  private

  # Create associated region instances from templates
  def create_regions
    template.region_templates.each do |t|
      region = Region.create!(:region_template => t, :world => self)
    end
  end

end
