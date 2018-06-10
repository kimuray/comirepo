class Api::EmotionsController < ApplicationController
  def index
    @emotions = Emotion.order(:id)
    render json: @emotions
  end
end
