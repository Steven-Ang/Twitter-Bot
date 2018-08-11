require "twitter_api"

class TweetsController < ApplicationController
  def new
    @tweet = Tweet.new
  end

  def create
    @user = current_user.id
    @tweet = Tweet.new(tweet_params)
    @tweet.user_id = current_user.id
    if @tweet.save
      @tweet.update(tweet_type: "scheduled")
      TwitterJob.set(wait: 1.minutes).perform_later(@user, @tweet.content, @tweet.id)
      redirect_to show_user_path(current_user)
    else
      redirect_to root_path
    end
  end

  private

  def tweet_params
    params.require(:tweet).permit(:content)
  end

end
