class CreateEnemies < ActiveRecord::Migration
  def self.up
    create_table :enemies do |t|
      t.integer :health, :null => false, :default => 100
      t.references :enemy_template, :null => false
      t.references :region

      t.timestamps
    end
  end

  def self.down
    drop_table :enemies
  end
end
