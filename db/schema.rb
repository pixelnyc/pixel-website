# encoding: UTF-8
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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150526150242) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admin_users", force: :cascade do |t|
    t.string   "name"
    t.string   "email",               default: "", null: false
    t.string   "encrypted_password",  default: "", null: false
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",       default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree

  create_table "applications", force: :cascade do |t|
    t.string   "email"
    t.integer  "vacancy_id"
    t.string   "portfolio_url"
    t.string   "location"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone"
    t.string   "linkedin_url"
    t.string   "website"
    t.string   "resume"
    t.string   "cover_letter"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "galleries", force: :cascade do |t|
    t.integer  "galleryable_id"
    t.string   "galleryable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "galleries", ["galleryable_id", "galleryable_type"], name: "index_galleries_on_galleryable_id_and_galleryable_type", using: :btree

  create_table "gallery_photos", force: :cascade do |t|
    t.string   "photo"
    t.integer  "gallery_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "gallery_photos", ["gallery_id"], name: "index_gallery_photos_on_gallery_id", using: :btree

  create_table "news_articles", force: :cascade do |t|
    t.string   "title"
    t.string   "slug"
    t.string   "cover"
    t.string   "author"
    t.text     "readout"
    t.text     "content"
    t.boolean  "published",  default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.string   "slug"
    t.text     "description"
    t.text     "content"
    t.string   "tile_cover"
    t.string   "carousel_cover"
    t.boolean  "in_carousel"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "cover"
    t.string   "video"
    t.text     "services"
    t.string   "carousel_title"
    t.text     "carousel_description"
    t.string   "carousel_text_color",  default: "light"
    t.string   "link"
  end

  create_table "seed_migration_data_migrations", force: :cascade do |t|
    t.string   "version"
    t.integer  "runtime"
    t.datetime "migrated_on"
  end

  create_table "site_settings", force: :cascade do |t|
    t.string   "code"
    t.string   "name"
    t.text     "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vacancies", force: :cascade do |t|
    t.string   "position"
    t.string   "location"
    t.string   "slug"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "vacancies", ["slug"], name: "index_vacancies_on_slug", using: :btree

  create_table "wysiwyg_attachments", force: :cascade do |t|
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "wysiwyg_videos", force: :cascade do |t|
    t.string   "video"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
