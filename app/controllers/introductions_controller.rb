class IntroductionsController < ApplicationController
  before_action :set_user
  before_action :logged_in_user, only: [:show, :edit, :update, :destroy]
  before_action :set_introduction, only: [:show, :destroy, :edit, :update]
  before_action :logged_in_user
  before_action :correct_user
  
  def show
    @likes = Like.where(introduction_id: params[:id])
    @tags = Tag.all
  end
  
  def like
    @user = User.find(current_user.id)
    @like = Like.new(introduction_id: params[:id], voter_id: @user.id)
    @like.save
    redirect_to introduction_path(params[:id])
  end

  def unlike
    @user = User.find(current_user.id)
    @like = Like.find_by(introduction_id: params[:id], voter_id: @user.id)
    @like.destroy
    redirect_to introduction_path(params[:id])
  end

  def new
    @introduction = Introduction.new
  end
  
  def create
    @introduction = @user.introductions.build(introduction_params)
    if @introduction.save
      tags = introduction_params[:tags].split(',')
        tags.each do |tag|
      @tag = Tag.create(introduction_id: @introduction.id, name: tag)
    end
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
      flash[:success] = "タスクを更新しました。"
      redirect_to user_introduction_url @user,@introduction
    else
      flash[:danger] = "タスクを更新できませんでした。"
      render :edit
    end
  end
  private
  
    def introduction_params
      params.require(:introduction).permit(:name, :contents, :tags)
    end

    def set_user
      @user = User.find(current_user.id)
    end

    def set_introduction
      @introduction = Introduction.find(params[:id])
    end

end
