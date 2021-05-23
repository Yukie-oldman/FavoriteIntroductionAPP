class IntroductionsController < ApplicationController
  before_action :set_user, only: [:edit, :index, :update, :create, :destroy]
  before_action :logged_in_user, only: [:show, :edit, :update, :destroy]
  before_action :set_introduction, only: [:destroy, :edit, :update]
  before_action :get_introduction, only: [:show, :like, :unlike]
  before_action :set_likes, onlt: [:show, :like, :unlike] 
  before_action :logged_in_user
  before_action :correct_user, only: [:edit, :create, :update, :destroy]
  
  def show
    @tags = Tag.where(introduction_id: params[:id])
  end
  
  def new
    @introduction = Introduction.new
  end
  
  def create
    @introduction = @user.introductions.new(introduction_params)
    if @introduction.save
      @introduction.create_tags
      flash[:success] = "好なものの紹介を投稿しました！"
      redirect_to user_introduction_url @user,@introduction
    else
      render :new
    end
  end

  def destroy
    @introduction.destroy
    flash[:success] = "紹介データを削除しました。"
      redirect_to user_introductions_url @user
  end
  
  def index
    @introductions = @user.introductions.order(id: "DESC")
    @tags = Tag.all
  end
  
  def edit
  end
    
  def update
    @introduction.update_attributes(introduction_params)
    if @introduction.save
      @introduction.update_tags
      flash[:success] = "投稿内容を更新しました！"
      redirect_to user_introduction_url @user,@introduction
    else
      render :edit
    end
  end

  def like
    @introduction.likes.create(voter_id: current_user.id)
  end

  def unlike
    @introduction.likes.find_by(voter_id: current_user.id).destroy
  end

  def introduce

  end
  private
  
    def introduction_params
      params.require(:introduction).permit(:caption, :name, :contents, :buf_tags, :image1, :image2, :image3)
    end

    def set_user
      # @user = User.find(current_user.id)
      @user = User.find(params[:user_id])
    end

    def set_introduction
      @introduction = @user.introductions.find(params[:id])
    end

    def get_introduction
      @introduction = Introduction.find(params[:id])
    end

    def set_likes
      @likes = Like.where(introduction_id: params[:id])
    end

end
