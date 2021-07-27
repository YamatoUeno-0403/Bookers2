class UsersController < ApplicationController
  

  def show
    @user = User.find(params[:id])
    @books = Book.where(user_id: @user.id)
    @book = Book.new
  end
  def index
    @users = User.all
    @book = Book.new
  end
  def new
    @user = User.new
  end
  
def create
    @book = Book.new(book_params)
    @book.user_id= current_user.id
  if @book.save
      redirect_to book_path(@book.id),  notice: "Book was successfully created."
  else
    @books = Book.all
    render 'index'
  end
end
    
  def edit
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to user_path(current_user)
    end
  end
  

  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: "You have updated user successfully."
    else
      render "edit"
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_path, notice: "Signed out successfully."
  end
  
    private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
  
end