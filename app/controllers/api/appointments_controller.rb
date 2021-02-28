class Api::AppointmentsController < Api::BaseController

  before_action :find_appointment, only: %w[show]

  def create
    user = find_or_create_user_from_patient_key(user_params[:patient_key])
    render_jsonapi_response user.appointments.create(appointment_params)
  end

  def show
    render_jsonapi_response(@appointment)
  end

  private

  def appointment_params
    result = params.permit(
        :Site_Name,
        :Session_Type,
        :Appointment_Date,
        :Appointment_Start_Time,
        :Appointment_End_Time,
        :Appointment_Description,
        :Facilitator_First_Name,
        :Facilitator_Last_Name,
        :Facilitator_Email,
        :Primary_Therapist_First_Name,
        :Primary_Therapist_Last_Name,
        :Primary_Therapist_Email,
        :Appointment_ID
      ).to_h.downcase_keys

      result[:id] = result.delete(:appointment_id)
      result[:date] = result.delete(:appointment_date)
      result[:start_time] = result.delete(:appointment_start_time)
      result[:end_time] = result.delete(:appointment_end_time)
      result[:description] = result.delete(:appointment_description)

      result.delete_blanks
    end

    def user_params
      result = params.permit(
        :Patient_Key,
        :Patient_MRN,
        :Episode_Number,
        :First_Admission_Date,
        :First_Name,
        :Last_Name,
        :Email,
        :Cell_Phone
        ).to_h.downcase_keys

      result[:phone] = result.delete(:cell_phone)

      result.delete_blanks
  end

  def find_appointment
    @appointment = Appointment.find(params[:id])
  end

  def find_or_create_user_from_patient_key(patient_key)
    u = User.find_by(patient_key: params[:Patient_Key])
    return u if u

    User.create(user_params, password: 'password123')
  end
end
