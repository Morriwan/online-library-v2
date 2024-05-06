class BooksController < ApplicationController

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to books_path
    else
      render :new
    end
  end

  def isbn_call
    response = HTTParty.get('https://openlibrary.org/isbn/#{params[:isbn]}')
    render json: response.body
  end

  private

  def book_params
    params.require(:book).permit(:name, :isbn, :author_id, :category_id, :genre_id)
  end
end
