require 'twitter_api'

class UsersController < ApplicationController
  def show
    @twitter_api = TwitterApi.new(User.find(params[:id]).nickname)
    @user = User.find(params[:id])
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
