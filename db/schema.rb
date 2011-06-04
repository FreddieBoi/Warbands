# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110603071110) do

  create_table "battles", :force => true do |t|
    t.string   "outcome",            :null => false
    t.integer  "enemy_id"
    t.integer  "enemy_template_id"
    t.integer  "warband_id"
    t.integer  "region_id"
    t.integer  "region_template_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "enemies", :force => true do |t|
    t.integer  "health",            :default => 100, :null => false
    t.integer  "enemy_template_id",                  :null => false
    t.integer  "region_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "enemy_templates", :force => true do |t|
    t.string   "name",                                :null => false
    t.integer  "region_template_id"
    t.text     "desc"
    t.integer  "combat_value",       :default => 0,   :null => false
    t.integer  "max_health",         :default => 100, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "enemy_templates", ["name"], :name => "index_enemy_templates_on_name", :unique => true

  create_table "item_templates", :force => true do |t|
    t.string   "name",                             :null => false
    t.text     "desc"
    t.integer  "cost",              :default => 0, :null => false
    t.string   "item_type"
    t.integer  "combat_value",      :default => 0, :null => false
    t.integer  "enemy_template_id"
    t.integer  "world_template_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "item_templates", ["name"], :name => "index_item_templates_on_name", :unique => true

  create_table "items", :force => true do |t|
    t.integer  "item_template_id", :null => false
    t.integer  "enemy_id"
    t.integer  "member_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "members", :force => true do |t|
    t.string   "name",                          :null => false
    t.integer  "level",        :default => 0,   :null => false
    t.integer  "experience",   :default => 0,   :null => false
    t.integer  "health",       :default => 100, :null => false
    t.integer  "max_health",   :default => 100, :null => false
    t.integer  "combat_value", :default => 0,   :null => false
    t.integer  "warband_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "news", :force => true do |t|
    t.string   "title",      :null => false
    t.text     "content",    :null => false
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "region_templates", :force => true do |t|
    t.string   "name",                             :null => false
    t.integer  "pos_x",             :default => 0, :null => false
    t.integer  "pos_y",             :default => 0, :null => false
    t.text     "desc"
    t.integer  "world_template_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "region_templates", ["name"], :name => "index_region_templates_on_name", :unique => true

  create_table "regions", :force => true do |t|
    t.integer  "region_template_id", :null => false
    t.integer  "world_id",           :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "slugs", :force => true do |t|
    t.string   "name"
    t.integer  "sluggable_id"
    t.integer  "sequence",                     :default => 1, :null => false
    t.string   "sluggable_type", :limit => 40
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "slugs", ["name", "sluggable_type", "sequence", "scope"], :name => "index_slugs_on_n_s_s_and_s", :unique => true
  add_index "slugs", ["sluggable_id"], :name => "index_slugs_on_sluggable_id"

  create_table "users", :force => true do |t|
    t.string   "email",                              :default => "",         :null => false
    t.string   "encrypted_password",  :limit => 128, :default => "",         :null => false
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name",                               :default => "New User", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",                              :default => false
    t.string   "rpx_identifier"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["name"], :name => "index_users_on_name", :unique => true

  create_table "warbands", :force => true do |t|
    t.string   "name",                      :null => false
    t.integer  "reputation", :default => 0, :null => false
    t.integer  "region_id"
    t.integer  "world_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "warbands", ["name"], :name => "index_warbands_on_name", :unique => true

  create_table "world_templates", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "worlds", :force => true do |t|
    t.integer  "user_id",           :null => false
    t.integer  "world_template_id", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
