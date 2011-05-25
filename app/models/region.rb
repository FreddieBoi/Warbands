class Region < ActiveRecord::Base

  attr_accessible :region_template, :world

  # The template the region is an instance of
  belongs_to :region_template

  # The world this region exists in
  belongs_to :world

  # A warband may be in this region
  has_one :warband

  # All the enemies in this region
  has_many :enemies

  # Create all the enemies in the region upon creation
  after_create :create_enemies
  # Get the region template
  def template
    region_template
  end

  def name
    template.name
  end

  def pos_x
    template.pos_x
  end

  def pos_y
    template.pos_y
  end

  def desc
    template.desc
  end

  private

  def create_enemies
    template.enemy_templates.each do |t|
      enemy = Enemy.create!(:enemy_template => t, :region => self)
    end
  end
end
