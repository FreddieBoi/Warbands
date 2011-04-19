class AddMemberReferencesToItems < ActiveRecord::Migration
  def self.up
    change_table :items do |t|
      t.references :member
    end
    
    # add_index :items, :member, :name => "items_member_id_index"
  end

  def self.down
  	# remove_index :items, :name => "items_member_id_index"
  	
  	change_table :items do |t|
  		t.remove :member
  	end
  end
end
