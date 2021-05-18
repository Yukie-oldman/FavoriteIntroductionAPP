class IntroductionsController < ApplicationController
  before_action :set_user
  before_action :logged_in_user, only: [:show, :edit, :update, :destroy]
  before_action :set_introduction, only: [:show, :destroy, :edit, :update, :like, :unlike]
  before_action :set_likes, onlt: [:show, :like, :unlike] 
  before_action :logged_in_user
  before_action :correct_user
  
  def show
    @tags = Tag.where(introduction_id: params[:id])
  end
  
  def like
    @introduction.likes.create(voter_id: current_user.id)
  end

  def unlike
    @introduction.likes.find_by(voter_id: current_user.id).destroy
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
  private
  
    def introduction_params
      params.require(:introduction).permit(:caption, :name, :contents, :buf_tags, :image1, :image2, :image3)
    end

    def set_user
      @user = User.find(current_user.id)
    end

    def set_introduction
      @introduction = Introduction.find(params[:id])
    end

    def set_likes
      @likes = Like.where(introduction_id: params[:id])
    end

end
