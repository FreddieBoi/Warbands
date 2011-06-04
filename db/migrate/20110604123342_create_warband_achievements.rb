class CreateWarbandAchievements < ActiveRecord::Migration
  def self.up
    create_table :warband_achievements do |t|
      t.references :warband
      t.references :achievement

      t.timestamps
    end
  end

  def self.down
    drop_table :warband_achievements
  end
end
