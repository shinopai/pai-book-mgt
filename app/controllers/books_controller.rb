class BooksController < ApplicationController
  def index
  end

  def create_index
    @book = Book.new

    render 'books/create/index', layout: 'modal'
  end

  # private
  private
  def book_params
    params.require(:book).permit(
      :title,
      :page_count,
      :published_at,
      :image,
      :book_format_id,
      :publisher_id,
      :book_language_id,
      :author_id,
      authors_attributes: [:name]
    )
  end
end
