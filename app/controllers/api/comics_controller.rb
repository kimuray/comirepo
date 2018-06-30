class Api::ComicsController < ApplicationController
  def index
    @comics = Comic.search_title(params[:word]).limit(10)
    render json: @comics.map { |comic| comic.title }
  end
end
