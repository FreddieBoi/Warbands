class CreateMembers < ActiveRecord::Migration
  def self.up
    create_table :members do |t|
      t.string :name, :null => false
      t.integer :level, :null => false, :default => 0
      t.integer :experience, :null => false, :default => 0
      t.integer :health, :null => false, :default => 100
      t.integer :max_health, :null => false, :default => 100
      t.integer :combat_value, :null => false, :default => 0
      t.references :warband

      t.timestamps
    end
  end

  def self.down
    drop_table :members
  end
end
