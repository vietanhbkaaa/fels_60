class Admin::UsersController < ApplicationController
  def index
    @users = User.paginate page: params[:page]
  end

  def show
    @user = User.find params[:id]
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = t"messages.user.destroy.success"
    redirect_to admin_users_url
  end
end
