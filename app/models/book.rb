class Book < ApplicationRecord
  # relation
  belongs_to :book_format
  belongs_to :publisher
  belongs_to :book_language
  belongs_to :author
  accepts_nested_attributes_for :author, allow_destroy: true

  # validation
  with_options presence: true do
   validates :title, length: { in: 1..30 }
   validates :birthday
   validates :email,    uniqueness: {case_sensitive: false},
                        format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}
   validates :password, length: {minimum: 7}

   with_options format: {with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/} do
     validates :first_name
     validates :last_name
   end

   with_options format: {with: /\A[ァ-ヶー－]+\z/} do
     validates :first_name_kana
     validates :last_name_kana
   end
 end
end
