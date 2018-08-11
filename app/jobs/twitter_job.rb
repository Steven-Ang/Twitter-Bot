require "twitter_api"

class TwitterJob < ApplicationJob
  queue_as :default

  def perform(user, content)
    # Do something later
    TwitterApi.new(User.find(user).nickname).tweet(content)
  end
end
