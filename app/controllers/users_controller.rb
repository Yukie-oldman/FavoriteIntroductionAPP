class UsersController < ApplicationController
  before_action :set_user ,only: [:show, :edit, :update, :destroy, :edit_profile]
  before_action :logged_in_user, only: [:show, :edit, :update, :destroy, :edit_profile]
  before_action :admin_user , only: [:index]
  before_action :admin_or_correct, only: [:show, :edit, :destroy, :update]
  
  
  def show
    @user = User.find(params[:id])
  end

  def new
    unless current_user.nil? || current_user.admin? 
      redirect_to root_path
    else
      @user = User.new
    end
  end
  
  def edit_profile
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = '新規作成に成功しました。'
      redirect_to user_introductions_path @user
    else
      render :new
    end
  end
  
  def destroy
    @user.destroy
    flash[:success] = 'ユーザーを削除しました。'
    redirect_to root_url
  end
  
  def edit
  end
  
  def update
    @user.update(user_params)
    if @user.save
      flash[:success] = "ユーザー情報を更新しました。"
      redirect_to user_url @user
    else
      flash[:danger] = "ユーザー情報を更新できませんでした。"
      render :edit
    end
  end
  
  def index
    @users = User.paginate(page: params[:page])
  end
  
  private
  
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :profile)
    end
    
    def set_user
      @user = User.find(params[:id])
    end
end
