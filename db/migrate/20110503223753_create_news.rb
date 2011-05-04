class CreateNews < ActiveRecord::Migration
  def self.up
    create_table :news do |t|
      t.string :title, :null => false
      t.text :content, :null => false
      t.references :user

      t.timestamps
    end
  end

  def self.down
    drop_table :news
  end
end
