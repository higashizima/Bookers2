class UsersController < ApplicationController
  def index
    @book = Book.new
    @users = User.all
  end
  
  def create
     applicatio_create
  end
  
  def show
  end

  
    def edit
  end
end
