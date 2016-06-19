class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])

    @notes = @user.notes
    @note = @user.notes.new

    @checkins = @user.checkins
    @checkin = @user.checkins.new
  end
end