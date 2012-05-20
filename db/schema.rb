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

ActiveRecord::Schema.define(:version => 20120507044338) do

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.integer  "depth"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
    t.string   "homepage_photo_file_name"
    t.string   "homepage_photo_content_type"
    t.integer  "homepage_photo_file_size"
    t.datetime "homepage_photo_updated_at"
    t.boolean  "is_present_in_homepage"
    t.integer  "sort_order"
  end

  create_table "ckeditor_assets", :force => true do |t|
    t.string   "data_file_name",                  :null => false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    :limit => 30
    t.string   "type",              :limit => 30
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], :name => "idx_ckeditor_assetable"
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], :name => "idx_ckeditor_assetable_type"

  create_table "clients", :force => true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "preferred_name"
    t.integer  "country_id"
    t.string   "city"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "countries", :force => true do |t|
    t.integer  "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hotels", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "country"
    t.string   "city"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "impressions", :force => true do |t|
    t.string   "impressionable_type"
    t.integer  "impressionable_id"
    t.integer  "user_id"
    t.string   "controller_name"
    t.string   "action_name"
    t.string   "view_name"
    t.string   "request_hash"
    t.string   "ip_address"
    t.string   "session_hash"
    t.text     "message"
    t.text     "referrer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "impressions", ["controller_name", "action_name", "ip_address"], :name => "controlleraction_ip_index"
  add_index "impressions", ["controller_name", "action_name", "request_hash"], :name => "controlleraction_request_index"
  add_index "impressions", ["controller_name", "action_name", "session_hash"], :name => "controlleraction_session_index"
  add_index "impressions", ["impressionable_type", "impressionable_id", "ip_address"], :name => "poly_ip_index"
  add_index "impressions", ["impressionable_type", "impressionable_id", "request_hash"], :name => "poly_request_index"
  add_index "impressions", ["impressionable_type", "impressionable_id", "session_hash"], :name => "poly_session_index"
  add_index "impressions", ["user_id"], :name => "index_impressions_on_user_id"

  create_table "last_minute_dates", :force => true do |t|
    t.integer  "last_minute_offer_id"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "last_minute_offers", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.decimal  "start_from_price",   :precision => 12, :scale => 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.text     "long_description"
    t.integer  "sort_order"
    t.boolean  "is_highlighted"
  end

  create_table "private_services", :force => true do |t|
    t.string   "name"
    t.string   "city"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
  end

  create_table "programs", :force => true do |t|
    t.string   "name"
    t.string   "departure_day"
    t.string   "day_night"
    t.decimal  "two_pax",       :precision => 12, :scale => 2
    t.decimal  "sgl_suppl",     :precision => 12, :scale => 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tours", :force => true do |t|
    t.integer  "category_id"
    t.string   "name"
    t.string   "overview"
    t.text     "itinerary"
    t.text     "included"
    t.text     "not_included"
    t.text     "prices"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "travel_package_images", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "travel_package_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "travel_packages", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "country"
    t.string   "city"
    t.decimal  "price",                     :precision => 12, :scale => 2
    t.decimal  "sale_price",                :precision => 12, :scale => 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "private_service_id"
    t.decimal  "one_pax_g_or_d",            :precision => 12, :scale => 2
    t.decimal  "two_pax_g_or_d",            :precision => 12, :scale => 2
    t.decimal  "three_pax_g_or_d",          :precision => 12, :scale => 2
    t.decimal  "one_pax_g_and_d",           :precision => 12, :scale => 2
    t.decimal  "two_pax_g_and_d",           :precision => 12, :scale => 2
    t.decimal  "three_pax_g_and_d",         :precision => 12, :scale => 2
    t.decimal  "four_pax_g_and_d",          :precision => 12, :scale => 2
    t.decimal  "four_to_nine_pax",          :precision => 12, :scale => 2
    t.decimal  "ten_to_fifteen_pax",        :precision => 12, :scale => 2
    t.decimal  "sixteen_to_twentyfive_pax", :precision => 12, :scale => 2
    t.decimal  "five_to_nine_pax",          :precision => 12, :scale => 2
    t.decimal  "twenty_more_pax",           :precision => 12, :scale => 2
    t.string   "duration"
  end

  create_table "user_sessions", :force => true do |t|
    t.string   "login"
    t.string   "password"
    t.integer  "remember_me"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "login",                              :null => false
    t.string   "email",                              :null => false
    t.string   "crypted_password",                   :null => false
    t.string   "password_salt",                      :null => false
    t.string   "persistence_token",                  :null => false
    t.string   "single_access_token",                :null => false
    t.string   "perishable_token",                   :null => false
    t.integer  "login_count",         :default => 0, :null => false
    t.integer  "failed_login_count",  :default => 0, :null => false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
