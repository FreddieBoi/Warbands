class CreateRegions < ActiveRecord::Migration
  def self.up
    create_table :regions do |t|
      t.references :region_template, :null => false
      t.references :world, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :regions
  end
end
