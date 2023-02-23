class PublishersController < ApplicationController
  def books_index
    @publisher = Publisher.find(params[:id])
    @books = @publisher.books.page(params[:page])

    render 'publishers/books/index'
  end
end
