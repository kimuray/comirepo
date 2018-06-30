class Api::ComicsController < ApplicationController
  def index
    @comics = Comic.like_title_kana(params[:word]).limit(10)
    render json: @comics.map { |comic| comic.title }
  end
end
