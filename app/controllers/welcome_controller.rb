class WelcomeController < ApplicationController
  def index
    @tweet = Tweet.new
  end
end
