class SearchController < ApplicationController
  before_action :require_login
  def index
    @event = Event.where(['title LIKE ?', "%#{(params[:query])}%"])
    @video = Video.where(['title LIKE ?', "%#{(params[:query])}%"])
  end
end
