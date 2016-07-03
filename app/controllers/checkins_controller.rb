class CheckinsController < ApplicationController
  before_action :authenticate_user!
  def update
    checkin = Checkin.find(params[:id])

    checkin.complete = true if params[:complete].present?
    checkin.missed = true if params[:missed].present?

    if checkin.update_attributes(checkin_params)
      notice = 'Checkin was successfully updated'
    else
      alert = checkin.errors.full_messages
    end

    redirect_to :back, alert: alert, notice: notice
  end

  private
    def checkin_params
      params.require(:checkin).permit(:details, :short_term_goal, :user_id, :missed, :complete)
    end
end
