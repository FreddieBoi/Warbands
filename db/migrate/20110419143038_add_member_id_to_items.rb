class AddMemberIdToItems < ActiveRecord::Migration
  def self.up
    add_column :items, :member_id, :integer
    
    add_index :items, :member_id, :name => "items_member_id_index"
  end

  def self.down
  	remove_index :items, :name => "items_member_id_index"
  	
    remove_column :items, :member_id
  end
end
