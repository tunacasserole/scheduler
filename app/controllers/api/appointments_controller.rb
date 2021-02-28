class Api::AppointmentsController < Api::BaseController

  before_action :find_appointment, only: %w[show]

  def show
    render_jsonapi_response(@appointment)
  end

  private

  def find_appointment
    @appointment = appointment.find(params[:id])
  end

end
