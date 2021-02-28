# frozen_string_literal: true

class CreateAppointments < ActiveRecord::Migration[6.1]
  def self.up
		create_table :appointments do |t|
			t.integer :user_id
			t.date :date
			t.time :start_time
			t.time :end_time
			t.string :description
      t.string :site_name
			t.string :session_type
			t.string :facilitator_first_name
			t.string :facilitator_last_name
			t.string :facilitator_email
			t.string :primary_therapist_first_name
			t.string :primary_therapist_last_name
			t.string :primary_therapist_email

      t.timestamps null: false
    end

    add_index :appointments, :id, unique: true
  end

  def self.down
    drop_table :appointments
  end
end
