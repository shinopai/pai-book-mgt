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

ActiveRecord::Schema[7.0].define(version: 2023_02_07_061059) do
  create_table "authors", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false, comment: "著者名"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "book_formats", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false, comment: "書籍形式名"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "book_languages", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false, comment: "書籍言語名"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "books", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "title", null: false, comment: "書籍名"
    t.integer "page_count", null: false, comment: "ページ数"
    t.date "published_at", null: false, comment: "出版日"
    t.string "image", default: "img_book.webp", comment: "書籍画像"
    t.bigint "book_format_id", null: false
    t.bigint "publisher_id", null: false
    t.bigint "book_language_id", null: false
    t.bigint "author_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_books_on_author_id"
    t.index ["book_format_id"], name: "index_books_on_book_format_id"
    t.index ["book_language_id"], name: "index_books_on_book_language_id"
    t.index ["publisher_id"], name: "index_books_on_publisher_id"
  end

  create_table "publishers", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false, comment: "出版社名"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "books", "authors"
  add_foreign_key "books", "book_formats"
  add_foreign_key "books", "book_languages"
  add_foreign_key "books", "publishers"
end
