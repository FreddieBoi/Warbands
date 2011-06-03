class CreateItemTemplates < ActiveRecord::Migration
  def self.up
    create_table :item_templates do |t|
      t.string :name, :null => false
      t.text :desc
      t.integer :cost, :null => false, :default => 0
      t.string :item_type
      t.integer :combat_value, :null => false, :default => 0
      t.references :enemy_template
      t.references :world_template

      t.timestamps
    end

    add_index :item_templates, :name, :unique => true
  end

  def self.down
    drop_table :item_templates
  end
end
