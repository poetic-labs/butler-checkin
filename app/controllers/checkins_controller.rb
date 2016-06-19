class CheckinsController < ApplicationController
  before_action :authenticate_user!
  def create
    checkin = Checkin.new(checkin_params)

    if checkin.save
      notice = 'Checkin was successfully created'
    else
      alert = checkin.errors.full_messages
    end

    redirect_to :back, alert: alert, notice: notice
  end

  private
    def checkin_params
      params.require(:checkin).permit(:notes, :short_term_goal, :user_id)
    end
end
