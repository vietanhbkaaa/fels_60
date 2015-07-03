class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]
  before_action :user_find, only: [:show, :edit]
  def index
    @users = User.paginate page: params[:page], per_page: Settings.per_page.word
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      log_in @user
      flash[:success] = t "messages.welcome"
      redirect_to @user
    else
      render :new
    end
  end

  def show
    @lessons= @user.lessons
  end

  def edit
  end

  def update
    @user = User.find params[:id]
    if @user.update_attributes user_params
      flash[:success] = t "messages.update.success"
      redirect_to @user
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit :name, :email, :password, :password_confirmation
  end

  def user_find
    @user = User.find params[:id]
  end

  def correct_user
    @user = User.find params[:id]
    redirect_to root_url unless current_user? @user
  end

  def logged_in_user
    unless logged_in?
      flash[:danger] = t "messages.notice"
      redirect_to login_url
    end
  end
end
