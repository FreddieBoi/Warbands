class CreateItems < ActiveRecord::Migration
  def self.up
    create_table :items do |t|
      t.string :name, :null => false
      t.text :desc
      t.integer :cost, :null => false, :default => 0
      t.string :item_type
      t.references :member

      t.timestamps
    end

    add_index :items, :name, :unique => true
  end

  def self.down
    drop_table :items
  end
end
