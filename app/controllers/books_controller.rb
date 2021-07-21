class BooksController < ApplicationController
    def index
        @books = Book.all
        @book = Book.new
    end
    def show
      @user = User.find(params[:id])
      @books =Book.all
      
    end

    def update
      @user = User.find(params[:id])
      @user.update(user_params)
      redirect_to user_path(@user.id)
    end

    
    def create
      @book = Book.new(book_params)
      @book.user_id= current_user.id
      if @book.save
        flash[:success] = "Book was successfully created."
        redirect_to book_path(@book.id)
      else
        puts errors.full_messages
        @books = Book.all
        render 'index'
      end
    end

  
private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
