ActiveRecord::Schema.define(version: 20160629155747) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ideas", force: :cascade do |t|
    t.string   "content"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "ideas", ["user_id"], name: "index_ideas_on_user_id", using: :btree

  create_table "likes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "idea_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "likes", ["idea_id"], name: "index_likes_on_idea_id", using: :btree
  add_index "likes", ["user_id"], name: "index_likes_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "alias"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "ideas", "users"
  add_foreign_key "likes", "ideas"
  add_foreign_key "likes", "users"
end
