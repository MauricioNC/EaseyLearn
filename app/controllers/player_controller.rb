class PlayerController < ApplicationController
  before_action :require_login
  def index
    @videoPlayer = Video.where(title: params[:v_title])

    @videoPlayer.each do |auth|
      @author = User.where(id: auth.user_id)
      @videoRelated = Video.where.not(id: auth.id)
    end

    # Getting the events
    @events = Event.all
    @eventAuthor = []

    @events.each do |e|
      @eventAuthor << User.find_by(id: e.user_id)
    end
  end
end
