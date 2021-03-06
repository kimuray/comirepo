class Api::ImpressionsController < ApplicationController
  def create
    @impression = Impression.new(impression_params)
    if @impression.set_comic_and_save
      # @twitter_api.tweet(post_message)
      render :post
    else
      render json: optimize_error_response(@impression.errors), status: 422
    end
  end

  private

  def impression_params
    params.fetch(:impression, {}).permit(:comic_title, :volume_number, :evaluation_point, :report, :capture, emotion_ids: [])
  end

  def set_twitter_api
    @twitter_api = TwitterApi.new(current_user.access_token, current_user.access_token_secret)
  end

  def post_message
    <<~TWEET
      #{@impression.comic_title}を読みました

      #まんがのおばけ #{impression_url(@impression)}
    TWEET
  end

  def optimize_error_response(errors)
    errors.map do |key, value|
      res_key = key.to_s.camelize
      res_key[0] = res_key[0].downcase
      [res_key, value]
    end.to_h
  end
end
