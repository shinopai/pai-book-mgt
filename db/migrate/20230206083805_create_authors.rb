class CreateAuthors < ActiveRecord::Migration[7.0]
  def change
    create_table :authors do |t|
      t.string :name, null: false, comment: '著者名'

      t.timestamps
    end
  end
end
