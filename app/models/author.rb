class Author < ApplicationRecord
  # relation
  has_many :books, dependent: :destroy

  # validation
  validates :name, presence: true,
                   length: { in: 1..30 }
end
