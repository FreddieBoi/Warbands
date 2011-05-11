class CreateEnemyTemplates < ActiveRecord::Migration
  def self.up
    create_table :enemy_templates do |t|
      t.string :name, :null => false
      t.references :region
      t.text :desc
      # t.integer :health, :null => false, :default => 100
      t.integer :max_health, :null => false, :default => 100

      t.timestamps
    end
    
    add_index :enemy_templates, :name, :unique => true
  end

  def self.down
    drop_table :enemy_templates
  end
end
