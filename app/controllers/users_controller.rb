class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users_incomplete = User.incomplete
    @users_complete = User.complete
  end

  def show
    @user = User.find(params[:id])
    @note = @user.notes.new
    @checkins = @user.current_checkins
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(user_params)
    redirect_to @user, notice: 'User updated'
  end

  private
    def user_params
      params.require(:user).permit(:start_date)
    end
end