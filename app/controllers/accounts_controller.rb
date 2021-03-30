class AccountsController < ApplicationController
  before_action :set_user
  before_action :set_account, only: [:show, :destroy, :edit, :update]
  before_action :set_accounts, only: %i(show edit update destroy)
  before_action :logged_in_user
  before_action :correct_user
  
  def show
  end
  
  def new
    @account = Account.new
  end
  
  def create
    @account = @user.accounts.build(account_params)
    if @account.save
      flash[:success] = "出納情報を登録しました。"
      redirect_to user_accounts_url @user
    else
      render :new
    end
  end

  def destroy
    @account.destroy
    flash[:success] = "出納情報を削除しました。"
      redirect_to user_accounts_url @user
  end
  
  def index
    @accounts = @user.accounts.order(cashed_on: "DESC")
  end
  
  def edit

  end
    
  def update
    @account.update_attributes(account_params)
    if @account.save
      flash[:success] = "タスクを更新しました。"
      redirect_to user_accounts_url @account
    else
      flash[:danger] = "タスクを更新できませんでした。"
      render :edit
    end
  end
  private
  
    def account_params
      params.require(:account).permit(:summary, :category, :price, :description, :cashed_on)
    end

    def set_user
      @user = User.find_by(params[:user_id])
    end

    def set_account
      @account = Account.find(params[:id])
    end

    def set_accounts
      unless @accounts = @user.accounts.find_by(id: params[:id])
        flash[:danger] = "権限がありません。"
        redirect_to user_tasks_url @user
      end
    end
end
