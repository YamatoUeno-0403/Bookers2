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
    flash.now[:notice] = "Book was successfully created."
      redirect_to book_path(@book.id)
  else
    @books = Book.all
    render 'index'
  end
end
    
  def edit
    @user = User.find(params[:id])
  end
  

  
    def update
      @user = User.find(params[:id])
      if @user.update(user_params)
        flash.now[:notice] = "You have updated user successfully."
        redirect_to user_path(@user.id)
      else
      render "edit"
      end
    end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash.now[:notice] ="Signed out successfully."
    redirect_to root_path
  end
  
    private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
  

end
