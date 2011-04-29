class CreateWarbands < ActiveRecord::Migration
  def self.up
    create_table :warbands do |t|
      t.string :name
      t.integer :reputation
      t.references :region
      t.references :user

      t.timestamps
    end
  end

  def self.down
    drop_table :warbands
  end
end
