class CreateRegions < ActiveRecord::Migration
  def self.up
    create_table :regions do |t|
      t.string :name
      t.integer :pos_x
      t.integer :pos_y
      t.text :desc

      t.timestamps
    end
  end

  def self.down
    drop_table :regions
  end
end
