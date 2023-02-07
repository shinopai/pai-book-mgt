class CreateBookFormats < ActiveRecord::Migration[7.0]
  def change
    create_table :book_formats do |t|
      t.string :name, null: false, comment: '書籍形式名'

      t.timestamps
    end
  end
end
