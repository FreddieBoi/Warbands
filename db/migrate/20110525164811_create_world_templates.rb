class CreateWorldTemplates < ActiveRecord::Migration
  def self.up
    create_table :world_templates do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :world_templates
  end
end
