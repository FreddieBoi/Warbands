class CreateItems < ActiveRecord::Migration
  def self.up
    create_table :items do |t|
      t.string :name
      t.text :description
      t.integer :cost
      t.string :item_type

      t.timestamps
    end
    
    add_index :items, :name, :name => "items_name_index"
  end

  def self.down
  	remove_index :items, :name => "items_name_index"
  	
    drop_table :items
  end
end
