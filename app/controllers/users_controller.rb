class UsersController < ApplicationController

  def new
    @user = User.new()
  end

  def create
    @user = User.create(user_params)
    if @user.errors.empty?
      redirect_to @user
    else
      render :action => :new
    end
  end

  def show
    @user = User.find_by_slug(params[:id])
    if @user
      @title = "#{@user.username}"
    else
      redirect_to root_path
    end
  end

  def update
    @user = User.find(params[:id])
    if @user
      @user.update_attributes(user_params)
    end
    render :json => @user
  end

  private
    def user_params
      params.require(:user).permit(:username, :message, :shift)
    end
end