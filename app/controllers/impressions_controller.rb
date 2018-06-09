class ImpressionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_twitter_api, only: :create

  def new
    @impression = Impression.new
  end

  def create
    @impression = current_user.impressions.build(impression_params)
    if @impression.save
      @twitter_api.tweet(@impression.report)
      redirect_to root_url, notice: '感想文を提出しました'
    else
      render :new
    end
  end

  private

  def set_twitter_api
    @twitter_api = TwitterApi.new(current_user.access_token, current_user.access_token_secret)
  end

  def impression_params
    params.fetch(:impression, {}).permit(:comic_title, :best_scene, :report, { emotion_ids: [] })
  end
end
