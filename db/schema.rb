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

ActiveRecord::Schema.define(version: 20190209200312) do

  create_table "advertisements", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "advertisement_id"
    t.string   "name"
    t.text     "description",      limit: 65535
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.index ["advertisement_id"], name: "index_products_on_advertisement_id", unique: true, using: :btree
  end

  create_table "services", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "advertisement_id"
    t.string   "name"
    t.text     "description",      limit: 65535
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.index ["advertisement_id"], name: "index_services_on_advertisement_id", unique: true, using: :btree
  end

  create_table "user_ads", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.integer  "advertisement_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["advertisement_id"], name: "index_user_ads_on_advertisement_id", using: :btree
    t.index ["user_id"], name: "index_user_ads_on_user_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "versions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci" do |t|
    t.string   "item_type",  limit: 191,        null: false
    t.integer  "item_id",                       null: false
    t.string   "event",                         null: false
    t.string   "whodunnit"
    t.text     "object",     limit: 4294967295
    t.datetime "created_at"
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree
  end

  add_foreign_key "products", "advertisements"
  add_foreign_key "services", "advertisements"
end
