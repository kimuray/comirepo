class TwitterApi
  attr_reader :client

  def initialize(access_token, access_token_secret)
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key = ENV['TWITTER_KEY']
      config.consumer_secret = ENV['TWITTER_SECRET']
      config.access_token = access_token
      config.access_token_secret = access_token_secret
    end
  end

  def tweet(text)
    client.update(text)
  end
end
