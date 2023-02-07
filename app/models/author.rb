class Author < ApplicationRecord
  # relation
  has_many :books, dependent: :destroy
end
