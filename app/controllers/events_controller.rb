class EventsController < ApplicationController
  before_action :require_login
  def index
    @events = Event.where(user_id: current_user)
    @cat = Category.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(events_params)
    @event.user = current_user
      if @event.save
        redirect_to events_path
      else
        render "index"
      end
  end

  def update
    @even = Event.find(params[:id])
    if @even.update(:title=> params[:event][:title], :description=>params[:event][:description],
      :day=>params[:event][:day],:hour=>params[:event][:hour],
      :link=>params[:event][:link],:category_id=>params[:event][:category_id])
      redirect_to events_path
    end
  end

  def delete
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to events_path
  end

  def events_params
    params.require(:event).permit(:title, :description, :day, :hour, :link, :category_id)
  end

end
