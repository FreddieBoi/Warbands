class CreateAchievements < ActiveRecord::Migration
  def self.up
    create_table :achievements do |t|
      t.string :name, :null => false
      t.string :desc
      t.integer :reputation

      t.timestamps
    end

    add_index :achievements, :name, :unique => true
  end

  def self.down
    drop_table :achievements
  end
end
