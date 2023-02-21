class Book < ApplicationRecord
  # relation
  belongs_to :book_format, optional: true
  belongs_to :publisher, optional: true
  belongs_to :book_language, optional: true
  belongs_to :author, optional: true
  accepts_nested_attributes_for :author, allow_destroy: true

  # validation
  with_options presence: true do
   validates :title, length: { in: 1..30 }
   validates :page_count, numericality: { only_integer: true }
   validates :published_at
   validates :book_format_id
   validates :book_format, if: -> { book_format_id.present? }
   validates :publisher_id
   validates :publisher, if: -> { publisher_id.present? }
   validates :book_language_id
   validates :book_language, if: -> { book_language_id.present? }
   validates :author_id
   validates :author, if: -> { author_id.present? }
 end

  # book image
  mount_uploader :image, BookImageUploader
end
