require 'faker'
require 'factory_bot_rails'

module UserHelpers

  def create_user
    FactoryBot.create(:user,
			email: Faker::Internet.email,
			password: Faker::Internet.password
		)
  end

  def create_user_with_patient_key(patient_key)
    FactoryBot.create(:user,
			email: Faker::Internet.email,
			password: Faker::Internet.password,
			patient_key: patient_key
		)
  end

	def build_user
    FactoryBot.build(:user,
			email: Faker::Internet.email,
			password: Faker::Internet.password
		)
  end

end
