class StaticPagesController < ApplicationController
  def top
  end

  def search
  end

  def result
    if params[:keyword]
      @goods = RakutenWebService::Ichiba::Item.search(keyword: params[:keyword])
    end
  end

end
