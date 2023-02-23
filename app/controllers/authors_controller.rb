class AuthorsController < ApplicationController
  def books_index
    @author = Author.find(params[:id])
    @books = @author.books.page(params[:page])

    render 'authors/books/index'
  end
end
