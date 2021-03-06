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

ActiveRecord::Schema.define(:version => 20140314035945) do

  create_table "assets", :force => true do |t|
    t.string   "attachment_content_type"
    t.string   "attachment_file_name"
    t.string   "type"
    t.string   "title"
    t.integer  "attachment_size"
    t.integer  "user_id"
    t.datetime "attachment_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "category_id"
    t.integer  "tour_id"
    t.integer  "banner_id"
    t.integer  "tour_image_id"
  end

  add_index "assets", ["user_id"], :name => "index_assets_on_user_id"

  create_table "books", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "nationality"
    t.string   "email"
    t.integer  "number_of_passengers"
    t.integer  "tour_id"
    t.string   "aprox_date_of_travel"
    t.text     "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.integer  "depth"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
    t.boolean  "is_present_in_middle_homepage"
    t.integer  "sort_order"
    t.boolean  "is_present_in_lowerpage"
    t.text     "page_title"
    t.text     "meta_tag"
    t.integer  "created_by_id"
    t.integer  "last_updated_by_id"
    t.string   "cached_slug"
    t.string   "brief_description"
  end

  add_index "categories", ["cached_slug"], :name => "index_categories_on_cached_slug"

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

  create_table "contact_us", :force => true do |t|
    t.string   "name"
    t.string   "surname"
    t.string   "nationality"
    t.string   "email"
    t.integer  "number_of_passengers"
    t.text     "destination_or_package_of_interest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "aprox_date_of_travel"
    t.string   "phone"
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
    t.integer  "created_by_id"
    t.integer  "last_updated_by_id"
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

  create_table "programs", :force => true do |t|
    t.string   "name"
    t.string   "departure_day"
    t.string   "day_night"
    t.decimal  "two_pax",       :precision => 12, :scale => 2
    t.decimal  "sgl_suppl",     :precision => 12, :scale => 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], :name => "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], :name => "index_roles_on_name"

  create_table "slugs", :force => true do |t|
    t.string   "scope"
    t.string   "slug"
    t.integer  "record_id"
    t.datetime "created_at"
  end

  add_index "slugs", ["scope", "record_id", "created_at"], :name => "index_slugs_on_scope_and_record_id_and_created_at"
  add_index "slugs", ["scope", "record_id"], :name => "index_slugs_on_scope_and_record_id"
  add_index "slugs", ["scope", "slug", "created_at"], :name => "index_slugs_on_scope_and_slug_and_created_at"
  add_index "slugs", ["scope", "slug"], :name => "index_slugs_on_scope_and_slug"

  create_table "standalone_pages", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_active"
    t.integer  "sort_order"
    t.integer  "created_by_id"
    t.integer  "last_updated_by_id"
  end

  create_table "tour_days", :force => true do |t|
    t.string   "day_name"
    t.text     "description"
    t.integer  "tour_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tours", :force => true do |t|
    t.integer  "category_id"
    t.string   "name"
    t.text     "overview"
    t.text     "itinerary"
    t.text     "included"
    t.text     "not_included"
    t.text     "prices"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_last_minute_offer"
    t.text     "page_title"
    t.text     "meta_tag"
    t.integer  "created_by_id"
    t.integer  "last_updated_by_id"
    t.string   "cached_slug"
  end

  add_index "tours", ["cached_slug"], :name => "index_tours_on_cached_slug"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "first_name",             :default => "", :null => false
    t.string   "last_name",              :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "users_roles", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], :name => "index_users_roles_on_user_id_and_role_id"

end
