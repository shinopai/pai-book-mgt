class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title, null: false, comment: '書籍名'
      t.integer :page_count, null: false, comment: 'ページ数'
      t.date :published_at, null: false, comment: '出版日'
      t.string :image, comment: '書籍画像', default: 'img_book.webp'
      t.references :book_format, null: false, foreign_key: true
      t.references :publisher, null: false, foreign_key: true
      t.references :book_language, null: false, foreign_key: true
      t.references :author, null: false, foreign_key: true

      t.timestamps
    end
  end
end
