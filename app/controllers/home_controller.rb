class HomeController < ApplicationController
  before_action :require_login
  def index
    @videos = Video.all
    @user = User.all
  end
end
