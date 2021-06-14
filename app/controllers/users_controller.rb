class UsersController < ApplicationController
  before_action :user_admin, only: [:destroy,:edit,:update]
  def index
    @users = User.all
  end

  def edit
    @all_bank = Bank.all #サイドバーに必要（共通）
    @all_category = Category.all #サイドバーに必要（共通）
  end

  def update
    @all_bank = Bank.all #サイドバーに必要（共通）
    @all_category = Category.all #サイドバーに必要（共通）
    if current_user.update(user_params)
      redirect_to root_path ,notice: "ユーザー情報を更新しました。"
    else
      render :edit
    end
  end

  def destroy
    current_user.destroy
    redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :officer,:admin) 
  end

  def user_admin
     @users = User.all
     if  current_user.admin == false
         redirect_to root_path,notice: "管理権限がありません。"
     else
        #  render action: "edit"
     end
  end
end