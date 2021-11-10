class UsersController < ApplicationController

  def index
    @books = Book.all
    @users = User.all
    @book = Book.new
    # @user = User.page(params[:page]).reverse_order
    # @user = User.find(params[:id])
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


  def show
    @user = User.find(params[:id])
    @books = @user.books.all
    @book = Book.new
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render "edit"
    else
      redirect_to user_path(current_user.id)
    end
  end

  def update
    @user = User.find(params[:id])
    if  @user.update(user_params)
      redirect_to user_path(@user.id),notice: 'You have updated user successfully.'
    else
      @Users = User.all
      render:edit
    end


  end

  private
  def user_params
    params.require(:user).permit(:name, :profile_image,:introduction)
  end

end
