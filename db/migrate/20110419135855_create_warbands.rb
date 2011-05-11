class CreateWarbands < ActiveRecord::Migration
  def self.up
    create_table :warbands do |t|
      t.string :name, :null => false
      t.integer :reputation, :null => false, :default => 0
      t.references :region
      t.references :world

      t.timestamps
    end

    add_index :warbands, :name, :unique => true
  end

  def self.down
    drop_table :warbands
  end
end
