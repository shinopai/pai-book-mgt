class BookFormat < ApplicationRecord
  # relation
  has_many :books, dependent: :destroy
end
