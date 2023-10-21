class UsersController < ApplicationController
  def index
    @users = User.all
    @book = Book.new
  end
  
  def create
     application_create(book_params)
  end
  
  def show
    @user = User.find(params[:id])
    @books = @user.books 
    @book = Book.new
  end

  
    def edit
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to books_path
    end
    @user = User.find(params[:id])
    end
  
  def update
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to books_path
    end
    @user = User.find(params[:id])
  if @user.update(user_params)
    flash[:notice] ="You have updated user successfully."
    redirect_to user_path(@user.id) 
  end
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
