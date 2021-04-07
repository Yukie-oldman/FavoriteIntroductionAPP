require 'rubygems'
require 'google/api_client'
require 'trollop'

# ここで変数に基本情報を格納
DEVELOPER_KEY = 'AIzaSyBMwF-ycA-TMGLlTdjyPTLEAwwvzF4WlQw'
YOUTUBE_API_SERVICE_NAME = 'youtube'
YOUTUBE_API_VERSION = 'v3'

def get_service
  client = Google::APIClient.new(
    key: DEVELOPER_KEY,
    authorization: nil,
    application_name: 'searchapp',
    application_version: '1.0',
    user_agent: 'Foo/1.0 google-api-ruby-client/0.8.6 Linux/4.15.0-65-generic (gzip)'
  )
  youtube = client.discovered_api(YOUTUBE_API_SERVICE_NAME + YOUTUBE_API_VERSION)
  return client, youtube
end