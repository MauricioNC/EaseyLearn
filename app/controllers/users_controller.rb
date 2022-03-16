class UsersController < ApplicationController
  before_action :require_login, only: [:editUser, :edit, :myContent]
  before_action :get_current_user, only: [:editUser, :edit, :myContent]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user2 = User.find_by(email:params[:email])
      redirect_to new_path, notice: 'This email already exist'
    else
      if @user.save
        flash[:notice] = "User created."
        redirect_to root_path
      else
        render :new
      end
    end
  end

  def myContent
    @videos = Video.all
  end

  def editUser
  end

  def edit
     @user.update(update_params)
     if @user.save
      flash[:notice] = "User successfully update"
      redirect_to root_path
     else 
      redirect_to edit_path
     end
  end

  private
  def get_current_user
    @user = @current_user
  end
  def user_params 
    params.require(:user).permit(:name, :email, :password)
  end
  def update_params 
    params.require(:user).permit(:name, :email, :description ,:password)
  end
end
