class BooksController < ApplicationController
    def show
      @user = User.find(params[:id])
      @books =Book.all
    end
    def index
        @books = Book.all
        @book = Book.new
    end
    def update
      @user = User.find(params[:id])
      @user.update(user_params)
      redirect_to user_path(@user.id)
    end
  
private

  def user_params
    params.require(:user).permit(:title, :opinion)
  end
end
