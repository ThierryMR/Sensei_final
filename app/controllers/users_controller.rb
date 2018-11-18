class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @sensei = @user.sensei
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  def user_params
    params.require(:user).permit(:username, :email)
  end
end
