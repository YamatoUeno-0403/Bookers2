class BooksController < ApplicationController
  
  
  before_action :authenticate_user!
  
  
    def index
        @books = Book.all
        @book = Book.new
        
    end
        
    def show
      @book = Book.find(params[:id])
      @user = @book.user
    end

    def update
      @book = Book.find(params[:id])
      @book.update(book_params)
      redirect_to book_path
    end

    
    def create
      @book = Book.new(book_params)
      @user = current_user
      @book.user_id= current_user.id
      if @book.save
        flash.now[:notice] = "You have created book successfully."
        redirect_to book_path(@book.id)
      else
        @books = Book.all
        render 'index'
      end
    end
    
        
  def edit
    @book = Book.find(params[:id])
  end
  
  
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    flash[:success] ="Signed out successfully."
    redirect_to books_path
  end

  
private

  def book_params
    params.require(:book).permit(:title, :body)
  end
  
  def user_params
    params.require(:user).permit(:name, :introduction)
  end
end
