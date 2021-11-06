class BooksController < ApplicationController
  
  def new
    # @book = book.new
  end
  
  def create
    # @pbook = book.new(book_params)
    # @book.user_id = current_user.id
    # if @book.save
    #   redirect_to book_path
    # else
    #   render :new
    # end
  end
  
  
  def index
    
  end

  def show
    @book = book.find(params[:id])
    @book = book.new  
  end

  def destroy
    @book = book.find(params[:id])
    @book.destroy
    redirect_to book_path
  end
  
end
