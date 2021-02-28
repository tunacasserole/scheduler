require 'rails_helper'

describe Api::AppointmentsController, type: :request do

  let (:user) { create_user }
  let (:appointment) { create_appointment }

  context 'When the user does not exist' do
    before do
      login_with_api(user)
      binding.pry

      post api_appointments_url, headers: {
        'Authorization': response.headers['Authorization']
      },
      params: {
          'Patient_Key': '4286-5',
          'Patient_MRN': '4286',
          'Episode_Number': '5',
          'First_Admission_Date': '2017-07-04',
          'First_Name': 'ALISON',
          'Last_Name': 'KLINE',
          'Email': 'alison.kline25@gmail.com',
          'Cell_Phone': '215-983-5545',
          'Site_Name': 'Devon SUD Outpatient',
          'Session_Type': 'Group',
          'Appointment_Date': '2021-02-24',
          'Appointment_Start_Time': '10:00 AM',
          'Appointment_End_Time': '01:00 PM',
          'Appointment_Description': 'TH-IOP',
          'Facilitator_First_Name': 'MELISSA',
          'Facilitator_Last_Name': 'CARR',
          'Facilitator_Email': 'MCARR@recoverycoa.com',
          'Primary_Therapist_First_Name': 'Melissa',
          'Primary_Therapist_Last_Name': 'Carr',
          'Primary_Therapist_Email': 'MCARR@recoverycoa.com',
          'Appointment_ID': '580551'
      }
    end

    it 'returns 200' do
      expect(response.status).to eq(200)
    end

    it 'creates the user' do
      # expect
    end

    it 'creates an appointment' do
      # expect(response.status).to eq(200)
    end
  end

  context 'When the user does exist' do
    before do
      login_with_api(user)
      create_user_with_patient_key('4286-5')

      post api_appointments_url, headers: {
        'Authorization': response.headers['Authorization']
      },
      params: {
          'Patient_Key': '4286-5',
          'Patient_MRN': '4286',
          'Episode_Number': '5',
          'First_Admission_Date': '2017-07-04',
          'First_Name': 'ALISON',
          'Last_Name': 'KLINE',
          'Email': 'alison.kline25@gmail.com',
          'Cell_Phone': '215-983-5545',
          'Site_Name': 'Devon SUD Outpatient',
          'Session_Type': 'Group',
          'Appointment_Date': '2021-02-24',
          'Appointment_Start_Time': '10:00 AM',
          'Appointment_End_Time': '01:00 PM',
          'Appointment_Description': 'TH-IOP',
          'Facilitator_First_Name': 'MELISSA',
          'Facilitator_Last_Name': 'CARR',
          'Facilitator_Email': 'MCARR@recoverycoa.com',
          'Primary_Therapist_First_Name': 'Melissa',
          'Primary_Therapist_Last_Name': 'Carr',
          'Primary_Therapist_Email': 'MCARR@recoverycoa.com',
          'Appointment_ID': '580551'
      }
    end

    it 'returns 200' do
      expect(response.status).to eq(200)
    end

    it 'creates an appointment' do
      # expect(response.status).to eq(200)
    end
  end

  # context 'When the user already exists' do
  #   it 'creates an appointment' do
  #     expect(response.status).to eq(200)
  #   end
  # end

end
