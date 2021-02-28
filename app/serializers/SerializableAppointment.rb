class SerializableAppointment < JSONAPI::Serializable::Resource
  type 'appointments'

  attributes :id,
             :user_id,
             :date,
             :start_time,
             :end_time,
             :description,
             :site_name,
             :session_type,
             :facilitator_first_name,
             :facilitator_last_name,
             :facilitator_email,
             :primary_therapist_first_name,
             :primary_therapist_last_name,
             :primary_therapist_email

  link :self do
    @url_helpers.api_appointment_url(@object.id)
  end
end
