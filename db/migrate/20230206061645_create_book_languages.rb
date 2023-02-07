class CreateBookLanguages < ActiveRecord::Migration[7.0]
  def change
    create_table :book_languages do |t|
      t.string :name, null: false, comment: '書籍言語名'

      t.timestamps
    end
  end
end
