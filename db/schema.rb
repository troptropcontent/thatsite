# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_02_09_211532) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "business_hours", force: :cascade do |t|
    t.bigint "office_id", null: false
    t.integer "weekday", null: false
    t.time "opens_at", null: false
    t.time "closes_at", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["office_id"], name: "index_business_hours_on_office_id"
  end

  create_table "businesses", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "businesses_users", id: false, force: :cascade do |t|
    t.bigint "business_id", null: false
    t.bigint "user_id", null: false
    t.index ["business_id"], name: "index_businesses_users_on_business_id"
    t.index ["user_id"], name: "index_businesses_users_on_user_id"
  end

  create_table "color_palettes", force: :cascade do |t|
    t.string "first"
    t.string "second"
    t.string "third"
    t.string "fourth"
    t.string "fifth"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "font_pairs", force: :cascade do |t|
    t.string "link_tag_href"
    t.string "primary"
    t.string "primary_backup"
    t.string "secondary"
    t.string "secondary_back_up"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "offices", force: :cascade do |t|
    t.bigint "business_id", null: false
    t.string "address_full", null: false
    t.string "address_complement"
    t.string "address_zipcode", null: false
    t.string "addresse_city", null: false
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["business_id"], name: "index_offices_on_business_id"
  end

  create_table "pages", force: :cascade do |t|
    t.string "type"
    t.bigint "site_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.index ["site_id"], name: "index_pages_on_site_id"
  end

  create_table "sections", force: :cascade do |t|
    t.bigint "page_id", null: false
    t.string "content"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["page_id", "name"], name: "index_sections_on_page_id_and_name", unique: true
    t.index ["page_id"], name: "index_sections_on_page_id"
  end

  create_table "sites", force: :cascade do |t|
    t.bigint "color_palette_id", null: false
    t.bigint "font_pair_id", null: false
    t.bigint "business_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["business_id"], name: "index_sites_on_business_id"
    t.index ["color_palette_id"], name: "index_sites_on_color_palette_id"
    t.index ["font_pair_id"], name: "index_sites_on_font_pair_id"
  end

  create_table "team_members", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "role", null: false
    t.string "email"
    t.bigint "business_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["business_id"], name: "index_team_members_on_business_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at", precision: 6
    t.datetime "remember_created_at", precision: 6
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "business_hours", "offices"
  add_foreign_key "offices", "businesses"
  add_foreign_key "sections", "pages"
  add_foreign_key "sites", "businesses"
  add_foreign_key "sites", "color_palettes"
  add_foreign_key "sites", "font_pairs"
  add_foreign_key "team_members", "businesses"
end
