class Api::ImpressionsController < ApplicationController
  before_action :set_twitter_api, only: :create

  def create
    @impression = current_user.impressions.build(impression_params)
    if @impression.save
      # @twitter_api.tweet(post_message)
      render json: @impression
    end
  end

  private

  def impression_params
    params.fetch(:impression, {}).permit(:comic_title, :best_scene, :report, :capture, emotion_ids: [])
  end

  def set_twitter_api
    @twitter_api = TwitterApi.new(current_user.access_token, current_user.access_token_secret)
  end

  def post_message
    <<~TWEET
      #{@impression.comic_title}を読みました

      #こみれぽ #{impression_url(@impression)}
    TWEET
  end
end
