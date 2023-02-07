class CreatePublishers < ActiveRecord::Migration[7.0]
  def change
    create_table :publishers do |t|
      t.string :name, null: false, comment: '出版社名'

      t.timestamps
    end
  end
end
