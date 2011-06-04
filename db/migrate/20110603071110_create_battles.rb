class CreateBattles < ActiveRecord::Migration
  def self.up
    create_table :battles do |t|
      t.string :outcome, :null => false
      t.references :enemy
      t.references :enemy_template
      t.references :warband
      t.references :region
      t.references :region_template

      t.timestamps
    end
  end

  def self.down
    drop_table :battles
  end
end
