require "twitter_api"

class TwitterJob < ApplicationJob
  queue_as :default

  def perform(user, content, tweet_id)
    # Do something later
    TwitterApi.new(User.find(user).nickname).tweet(content)
    Tweet.find(tweet_id).update(tweet_type: "sent")
  end
end
