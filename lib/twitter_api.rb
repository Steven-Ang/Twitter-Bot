class TwitterApi
  def initialize(user)
    @user = user
  end

  def our_public_tweets
    client.user_timeline(user, count: 15, exclude_replies: true, include_rts: true)
  end

  private

  attr_reader :user

  def client
    @client ||= Twitter::REST::Client.new do |config|
      config.consumer_key        =  ENV["TWITTER_KEY"]
      config.consumer_secret     =  ENV["TWITTER_SECRET"]
      config.access_token        =  ENV["TWITTER_ACCESS_TOKEN"]
      config.access_token_secret =  ENV["TWITTER_ACCESS_TOKEN_SECRET"]
    end
  end
  
end