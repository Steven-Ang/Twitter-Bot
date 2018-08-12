require 'twitter_api'

class UsersController < ApplicationController
  def show
    @tweet = Tweet.new
    @user = User.find(params[:id])
    @user_tweets = @user.tweets.all
    @twitter_api = TwitterApi.new(User.find(@user.id).nickname)

    respond_to do |format|
      format.html
      format.js
    end

  end

  def scheduled
    @tweet = Tweet.new
    @user = User.find(params[:id])
    @user_tweets = @user.tweets.scheduled
    @twitter_api = TwitterApi.new(User.find(@user.id).nickname)
    render action: :show
  end

  def sent
    @tweet = Tweet.new
    @user = User.find(params[:id])
    @user_tweets = @user.tweets.sent
    @twitter_api = TwitterApi.new(User.find(@user.id).nickname)
    render action: :show
  end

  def new

  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/sign_up'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :nickname, :description, :location, :image, :email, :password, :password_confirmation)
  end

end
