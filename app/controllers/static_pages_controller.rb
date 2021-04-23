class StaticPagesController < ApplicationController
  include StaticPagesHelper

  def top
  end

  def search
    if params[:keyword]
      get_Rakuten_list(params[:keyword])
      get_Youtube_movie_list(params[:keyword])
    end
  end

  def result
  end 

  def introductions
    set_introductions
    set_likes
    set_tags
  end
  private

    def set_introductions
      @introductions = Introduction.order(id: "DESC")
      if params[:keyword].present?
        keyword = Tag.where(name: params[:keyword]).pluck('introduction_id') 
        @introductions = @introductions.find(keyword)
      end
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

end
