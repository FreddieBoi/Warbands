class CreateItems < ActiveRecord::Migration
  def self.up
    create_table :items do |t|
      t.references :item_template, :null => false
      t.references :enemy
      t.references :member
      t.references :warband

      t.timestamps
    end
  end

  def self.down
    drop_table :items
  end
end
