class UsersController < ApplicationController
  before_action user_admin, only: [:index]
  def index
    @users = User.all
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path ,notice: "ユーザー情報を更新しました。"
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :officer) 
  end

  def user_admin
     @users = User.all
     if  current_user.admin == false
         redirect_to root_path
     else
         render action: "index"
     end
  end
end