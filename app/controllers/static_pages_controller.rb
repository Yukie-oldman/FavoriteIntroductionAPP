class StaticPagesController < ApplicationController
  def top
  end

  def search
  end

  def result
    @keyword = params[:keyword]
  end

end
