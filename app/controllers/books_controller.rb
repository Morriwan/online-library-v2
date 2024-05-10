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
    data = LibraryApiService.new(params[:isbn]).call
    @book = Book.new(data)
    if @book.save
      redirect_to books_path
    else
      render :index
    end
  end


  private

  def book_params
    params.require(:book).permit(:title, :isbn, :author_id, :genre_id)
  end
end
