class Teacher < ApplicationRecord
	has_many :ensemble
	has_many :group

	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :election_date, presence: true
	validates :election_period, presence: true

end
