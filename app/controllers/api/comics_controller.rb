class Api::ComicsController < ApplicationController
  def index
    @comics = Comic.like_title_kana(params[:word]).limit(20)
    p @comics.map { |comic| comic.title }
    render json: @comics.map { |comic| comic.title }
  end
end
