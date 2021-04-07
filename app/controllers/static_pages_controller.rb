class StaticPagesController < ApplicationController
  include StaticPagesHelper

  def top
  end

  def search
  end

  def result
    if params[:keyword]
      # get_Rakuten_list(params[:keyword])
      get_Youtube_movie_list(params[:keyword])
    end
  end 

end
