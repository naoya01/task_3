class UsersController < ApplicationController
  def index
      @user = User.find(params[:id])
  end
  
  def show
    @user = User.find(params[:id])   
  end
  
  def edit
  end
  
  def update
  end
  
  def destroy
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
end
