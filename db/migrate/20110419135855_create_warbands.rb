class CreateWarbands < ActiveRecord::Migration
  def self.up
    create_table :warbands do |t|
      t.string :name
      t.integer :reputation
      t.integer :pos_x
      t.integer :pos_y

      t.timestamps
    end
  end

  def self.down
    drop_table :warbands
  end
end
