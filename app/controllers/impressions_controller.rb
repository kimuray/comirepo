class ImpressionsController < ApplicationController
  before_action :set_twitter_api

  def create
    @twitter_api.tweet(params[:text])
    redirect_to root_url
  end

  private

  def set_twitter_api
    @twitter_api = TwitterApi.new(current_user.access_token, current_user.access_token_secret)
  end
end
