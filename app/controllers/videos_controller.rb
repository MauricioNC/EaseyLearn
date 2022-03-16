require "faraday"

class VideosController < ApplicationController
  before_action :require_login

  def index
  end
  
  def new
    @video = Video.new
    @categories = Category.all
  end
  
  def create
    @videoID = params[:video][:link]
    if @videoID.empty?
      flash[:alert] = "The fields cannot be empty"
      redirect_to new_video_path
    else
      @response = Faraday.get("https://youtube.googleapis.com/youtube/v3/videos?part=snippet&id=#{@videoID}&key=#{ENV["API_KEY"]}")

      @data = JSON.parse(@response.body)

      @title = @data["items"][0]["snippet"]["title"]
      @description = @data["items"][0]["snippet"]["description"]
      @date = Time.now.strftime("%Y-%m-%d")

      @cat = params[:category]

      if Video.find_by(title: @title)
        flash[:alert] = "This video already exist"
        redirect_to new_video_path
      else
        @new_video = Video.create(title: @title, description: @description, date: @date, link: @videoID, user_id: session[:user_id], category_id: @cat)
  
        if @new_video.valid?
          flash[:notice] = "The video was uploaded successfully"
          redirect_to new_video_path
        else
          flash[:notice] = "Error"
        end
      end
    end
  end  
end
