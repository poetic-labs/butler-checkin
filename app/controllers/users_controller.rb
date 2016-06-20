class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])

    @notes = @user.notes.order('id desc')
    @note = @user.notes.new

    @checkins = @user.checkins.order('id desc')
    @checkin = @user.checkins.new
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