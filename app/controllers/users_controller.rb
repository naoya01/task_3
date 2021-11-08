class UsersController < ApplicationController

  def index
    @user = User.all
    @post_images = @user.post_images.page(params[:page]).reverse_order

  end

  def show
    @user = User.find(params[:id])

  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if  @user.update(user_params)
      redirect_to user_path(@user.id)
    else
      @User = User.all
      render:index
    end


  end

  private
  def user_params
    params.require(:user).permit(:name, :profile_image)
  end

end
