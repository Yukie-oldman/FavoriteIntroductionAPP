module StaticPagesHelper

  def get_Rakuten_list(keyword)
    @goods = RakutenWebService::Ichiba::Item.search(keyword: keyword)
  end

  def get_Youtube_movie_list(keyword)
    # require 'youtube.rb'#先ほど上で準備したファイルを呼ぶ
    opts = Trollop::options do
      opt :q, 'Search term', type: :string, default: keyword
      opt :max_results, 'Max results', :type => :int, :default => 20
      opt :order, 'order', :type => String, :default => 'date'
      opt :type, 'type', :type => String, :default => 'video'
      opt :regionCode, 'region', :type => String, :default => 'JP'
    end
    
    client, youtube = get_service
  
    begin
  
      search_response = client.execute!(
        :api_method => youtube.search.list,
        :parameters => {
          :part => 'snippet',
          :q => opts[:q],
          :maxResults => opts[:max_results],
          :order => 'viewCount',
          :type => opts[:type],
          :regionCode => opts[:regionCode]
        }
      )
  
    @youtube_movies = search_response.data.items#Jsonの中身が多かったので必要な情報のみ受けれるようにしています。

    rescue Google::APIClient::TransmissionError => e
      puts e.result.body
    end
  end
  def introductions
    set_introductions
    set_likes
    set_tags
    @hot_tags = Tag.group(:name).order('count_all DESC').limit(20).count
    @follow_tags = @user.follow_tags
  end

end
