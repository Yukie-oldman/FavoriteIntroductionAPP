class StaticPagesController < ApplicationController
  include StaticPagesHelper
  before_action :set_user, only: [:introductions, :followtag_search, :hot_tag, :follow, :unfollow, :add_tag]
  before_action :set_followtags, only: [:hot_tag, :follow, :unfollow]
  

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
      redirect_to request.referrer
    else
      @user.follow_tags.create(name: params[:name])
      flash[:success] = 'タグを追加しました'
      redirect_to request.referrer
    end

  end

  def followtag_search
    @follow_tags = @user.follow_tags
    str_tag = @follow_tags.pluck('name')
    keyword = Tag.where(name: str_tag).pluck('introduction_id') 
    @introductions = Introduction.find(keyword)
    set_likes
    set_tags
  end

  def introductions
    set_introductions
    set_likes
    set_tags
    @hot_tags = Tag.group(:name).order('count_all DESC').limit(20).count
    @follow_tags = @user.follow_tags
  end

  def hot_tag
    @hot_tags = Tag.group(:name).order('count_all DESC').limit(20).count
  end

  def follow
    @target = params[:tagname]
    @user.follow_tags.create(name: params[:tagname])
  end

  def unfollow
    @target = params[:tagname]
    @user.follow_tags.find_by(name: params[:tagname]).destroy
  end
  private

    def set_introductions
      @introductions = Introduction.order(id: "DESC")
      if params[:tag].present?
        keyword = Tag.where(name: params[:tag]).pluck('introduction_id') 
        @introductions = @introductions.find(keyword)
      elsif params[:keyword].present?
        case params[:category]
        when '1'
          @introductions = @introductions.where("name LIKE ?","%#{params[:keyword]}%")
        when '2'
          @introductions = @introductions.where("caption LIKE ?","%#{params[:keyword]}%")
        when '3'
          keyword = Tag.where("name LIKE ?","%#{params[:keyword]}%").pluck('introduction_id') 
          @introductions = @introductions.find(keyword)
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
