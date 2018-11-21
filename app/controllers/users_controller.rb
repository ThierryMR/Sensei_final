class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @sensei = Sensei.new
    @lesson_requests = LessonRequest.where(user_id: current_user)
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
