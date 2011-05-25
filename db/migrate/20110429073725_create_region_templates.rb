class CreateRegionTemplates < ActiveRecord::Migration
  def self.up
    create_table :region_templates do |t|
      t.string :name, :null => false
      t.integer :pos_x, :null => false, :default => 0
      t.integer :pos_y, :null => false, :default => 0
      t.text :desc
      t.references :world_template

      t.timestamps
    end

    add_index :region_templates, :name, :unique => true
  end

  def self.down
    drop_table :region_templates
  end
end
