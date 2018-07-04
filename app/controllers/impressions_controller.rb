class ImpressionsController < ApplicationController
  before_action :authenticate_user!, except: :show

  def show
    @impression = Impression.find(params[:id])
  end

  def new
    @impression = Impression.new
  end

  private

  def impression_params
    params.fetch(:impression, {}).permit(:comic_title, :evaluation_point, :report, { emotion_ids: [] })
  end
end
