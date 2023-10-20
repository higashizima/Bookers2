class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def index
    @books = Book.all
  end
  
  def create
     application_create
  end

  def show
    @book = Book.find(params[:id])
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end
  
  
  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
  
end
