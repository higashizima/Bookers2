class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def index
    @book = Book.new
    @books = Book.all
  end
  
  def create
     application_create
  end

  def show
    @book = Book.find(params[:id])
    @book_new = Book.new
  end
  
  def edit
    book = Book.find(params[:id])
    unless book.user.id == current_user.id
      redirect_to books_path
    end
    @book = Book.find(params[:id])
  end
  
  def update
    book = Book.find(params[:id])
    unless book.user.id == current_user.id
      redirect_to books_path
    end
      @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "Book was successfully updated."
      redirect_to book_path(@book.id)  
    else
      render :edit
    end
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
