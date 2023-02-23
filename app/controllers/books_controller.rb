class BooksController < ApplicationController
  before_action :set_q, only: %i(index search)
  def index
    @books = Book.all.order(id: :desc).page(params[:page])
  end

  def show
    @book = Book.find(params[:id])

    # 著者の他の書籍取得(4件まで)
    @another_book = @book.author.books.where.not(id: @book).order(id: :desc).limit(4)
  end

  def create_index
    @book = Book.new

    render 'books/create/index', layout: 'modal'
  end

  def create_confirm
    @book = Book.new

    @book.title = book_params[:title]
    @book.page_count = book_params[:page_count]
    @book.published_at = book_params[:published_at]
    @book.image = book_params[:image]
    @book.book_format_id = book_params[:book_format_id]
    @book.publisher_id = book_params[:publisher_id]
    @book.book_language_id = book_params[:book_language_id]

    # 著者名がauthorsテーブルに存在していなければ登録、登録済みであれば該当レコードを取得
    book_params[:author_id] = 'hoge' if book_params[:author_id].nil?
    @author = Author.find_or_create_by(name: book_params[:author_id])

    # booksテーブルのauthor_idを登録
    @book.author_id = @author.id

    # バリデーションに引っかかる項目があれば登録フォームに戻す
    if @book.invalid?
      render 'books/create/index', layout: 'modal'
    else
      render 'books/create/confirm', layout: 'modal'
    end
  end

  def create_submit
    @book = Book.new

    @book.title = book_params[:title]
    @book.page_count = book_params[:page_count]
    @book.published_at = book_params[:published_at]
    @book.book_format_id = book_params[:book_format_id]
    @book.publisher_id = book_params[:publisher_id]
    @book.book_language_id = book_params[:book_language_id]

    # 著者名がauthorsテーブルに存在していなければ登録、登録済みであれば該当レコードを取得
    @author = Author.find_or_create_by(name: book_params[:author_id])

    # submitが「修正」なら登録画面に飛ばし、そうでなければ登録
    if params[:commit] == '修正'
      render 'books/create/index', layout: 'modal'
    else
    # booksテーブルのauthor_idを登録
    @book.author_id = @author.id

    # params[:image]が存在していたら画像名を取得して登録
    if !book_params[:image].nil?
      @book.image = book_params[:image]
    end

    begin
      @book.save!
      redirect_to books_create_finish_path, notice: '「' + book_params[:title] + '」を登録しました。'
    rescue ActiveRecord::RecordInvalid => e
      puts e
      render 'books/create/index', layout: 'modal'
    end
  end
  end

  def create_finish
    # 参照元が'/confirm'だった場合のみ表示
    if request.referer&.include?("confirm")
      render 'books/create/finish', layout: 'modal'
    else
      redirect_to root_path, status: :internal_server_error
    end
  end

  def search
    @books = @q.result
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

  def set_q
    @q = Book.ransack(params[:q])
  end
end
