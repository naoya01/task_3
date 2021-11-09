class BooksController < ApplicationController
  def index
    @books = Book.all
    @book = Book.new
  end



  def show
    @book = Book.find(params[:id])
    @books = Book.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if  @book.update(book_params)
    redirect_to book_path(@book.id),notice:"You have updated book successfully."
    else
      render:edit
      @book = Book.find(params[:id])
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book.id),notice: 'You have created book successfully.'
    else
      @books = Book.all
      render:index
    end
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
