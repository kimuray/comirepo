class ImpressionsController < ApplicationController
  before_action -> { correct_user(@impression.user) }, only: :destroy

  def new
    @impression = Impression.new
  end

  def destroy
    @impression.destroy
    redirect_to user_url(current_user), notice: '感想を削除しました'
  end

  private

  def set_impression
    @impression = Impression.find(params[:id])
  end

  def impression_params
    params.fetch(:impression, {}).permit(:comic_title, :evaluation_point, :report, { emotion_ids: [] })
  end
end
