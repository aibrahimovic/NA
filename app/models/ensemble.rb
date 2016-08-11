class Ensemble < ApplicationRecord
	belongs_to :teacher
	belongs_to :subject
	belongs_to :subject_role
	belongs_to :academic_year

end
