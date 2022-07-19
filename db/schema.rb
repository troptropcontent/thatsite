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

ActiveRecord::Schema.define(version: 2022_07_19_153245) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", precision: 6, null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

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
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "site_id"
    t.index ["site_id"], name: "index_businesses_on_site_id"
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

  create_table "context_data", force: :cascade do |t|
    t.string "holder_type", null: false
    t.bigint "holder_id", null: false
    t.bigint "context_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["context_id"], name: "index_context_data_on_context_id"
    t.index ["holder_type", "holder_id"], name: "index_context_data_on_holder"
  end

  create_table "contexts", force: :cascade do |t|
    t.bigint "page_id", null: false
    t.text "query", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["page_id"], name: "index_contexts_on_page_id"
  end

  create_table "font_pairs", force: :cascade do |t|
    t.string "link_tag_href"
    t.string "primary"
    t.string "primary_backup"
    t.string "secondary"
    t.string "secondary_backup"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "offices", force: :cascade do |t|
    t.bigint "business_id", null: false
    t.string "address_full", null: false
    t.string "address_complement"
    t.string "address_zipcode", null: false
    t.string "address_city", null: false
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "phone"
    t.string "address_country", null: false
    t.index ["business_id"], name: "index_offices_on_business_id"
  end

  create_table "pages", force: :cascade do |t|
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
    t.bigint "color_palette_id"
    t.bigint "font_pair_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name", null: false
    t.index ["color_palette_id"], name: "index_sites_on_color_palette_id"
    t.index ["font_pair_id"], name: "index_sites_on_font_pair_id"
    t.index ["name"], name: "index_sites_on_name", unique: true
  end

  create_table "sites_users", id: false, force: :cascade do |t|
    t.bigint "site_id", null: false
    t.bigint "user_id", null: false
    t.index ["site_id"], name: "index_sites_users_on_site_id"
    t.index ["user_id"], name: "index_sites_users_on_user_id"
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

  create_table "texts", force: :cascade do |t|
    t.bigint "site_id", null: false
    t.string "name", null: false
    t.text "content", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["site_id"], name: "index_texts_on_site_id"
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

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "business_hours", "offices"
  add_foreign_key "businesses", "sites"
  add_foreign_key "context_data", "contexts"
  add_foreign_key "contexts", "pages"
  add_foreign_key "offices", "businesses"
  add_foreign_key "sections", "pages"
  add_foreign_key "sites", "color_palettes"
  add_foreign_key "sites", "font_pairs"
  add_foreign_key "team_members", "businesses"
  add_foreign_key "texts", "sites"
end
