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

ActiveRecord::Schema.define(:version => 20110419143038) do

  create_table "items", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "cost"
    t.string   "item_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "member_id"
  end

  add_index "items", ["member_id"], :name => "items_member_id_index"
  add_index "items", ["name"], :name => "items_name_index"

  create_table "members", :force => true do |t|
    t.string   "name"
    t.integer  "level"
    t.integer  "experience"
    t.integer  "health"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "warbands", :force => true do |t|
    t.string   "name"
    t.integer  "reputation"
    t.integer  "pos_x"
    t.integer  "pos_y"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
