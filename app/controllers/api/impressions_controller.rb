class Api::ImpressionsController < ApplicationController
  def create
    @impression = current_user.impressions.build(impression_params)
    if @impression.save
      render json: @impression
    end
  end

  private

  def impression_params
    params.fetch(:impression, {}).permit(:comic_title, :best_scene, :report, :capture, emotion_ids: [])
  end
end
