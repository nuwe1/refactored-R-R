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

ActiveRecord::Schema.define(version: 2021_08_26_174606) do

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.string "excerpt"
    t.string "body"
    t.datetime "released_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["released_at"], name: "index_articles_on_released_at"
  end

  create_table "comments", force: :cascade do |t|
    t.string "name"
    t.text "body"
    t.integer "article_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "is_approved"
    t.index ["article_id"], name: "index_comments_on_article_id"
  end

  create_table "ratings", force: :cascade do |t|
    t.integer "rating"
    t.boolean "is_approved"
    t.integer "article_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["article_id"], name: "index_ratings_on_article_id"
  end

  add_foreign_key "comments", "articles"
  add_foreign_key "ratings", "articles"
end
