class StaticPagesController < ApplicationController
  include StaticPagesHelper
  before_action :set_user, only: [:introductions, :followtag_search, :follow, :unfollow, :add_tag]
  before_action :set_followtags, only: [:follow, :unfollow]
  

  def top
  end

  def rakuten_search
    if params[:keyword]
      get_Rakuten_list(params[:keyword])
    end
  end

  def youtube_search
    if params[:keyword]
      get_Youtube_movie_list(params[:keyword])
    end
  end

  def result
  end 

  def add_tag
    if FollowTag.where(user_id: @user.id, name: params[:name]).present?
      flash[:success] = '登録済のタグです'
      redirect_to followtag_search_path
    else
      @user.follow_tags.create(name: params[:name])
      flash[:success] = 'タグを追加しました'
      redirect_to followtag_search_path
    end
  end

  def followtag_search
    @follow_tags = @user.follow_tags
    if params[:tag].present?
      target_id = Tag.where(name: params[:tag]).pluck('introduction_id') 
      @introductions = Introduction.find(target_id)
    else
      str_tag = @follow_tags.pluck('name')
      target_id = Tag.where(name: str_tag).pluck('introduction_id') 
      @introductions = Introduction.find(target_id)
    end
    set_likes
    set_tags
  end

  def follow
    @target = params[:tagname]
    @url = params[:url]
    @user.follow_tags.create(name: params[:tagname])
  end

  def unfollow
    @target = params[:tagname]
    @url = params[:url]
    @user.follow_tags.find_by(name: params[:tagname]).destroy
  end

  private

    def set_introductions
      @introductions = Introduction.order(id: "DESC")
      if params[:tag].present?
        target_id = Tag.where(name: params[:tag]).pluck('introduction_id') 
        @introductions = @introductions.find(target_id)
      elsif params[:keyword].present?
        case params[:category]
        when '1'
          @introductions = @introductions.where("name LIKE ?","%#{params[:keyword]}%")
        when '2'
          @introductions = @introductions.where("caption LIKE ?","%#{params[:keyword]}%")
        when '3'
          target_id = Tag.where("name LIKE ?","%#{params[:keyword]}%").pluck('introduction_id') 
          @introductions = @introductions.find(target_id)
        end
      end
    end

    def set_user
      @user = User.find(current_user.id)
    end

    def set_like
      @like = Like.where(introduction_id: params[:id])
    end

    def set_likes
      @likes = Like.all
    end

    def set_tags
      @tags = Tag.all
    end

    def set_followtags
      @follow_tags = @user.follow_tags
    end
end
