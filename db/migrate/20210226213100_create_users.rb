# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[6.1]
  def self.up
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.string :user_type
      t.string :patient_key
      t.string :patient_mrn
      t.string :episode_number
      t.date :first_admission_date

      t.timestamps null: false
    end

    add_index :users, :email, unique: true
    add_index :users, :patient_key, unique: true
  end

  def self.down
    raise ActiveRecord::IrreversibleMigration
  end
end
