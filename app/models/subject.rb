class Subject < ApplicationRecord
	belongs_to :department
	has_many :ensemble
	has_many :group

	validates :code, presence: true
	validates :name, presence: true
	validates :study_cicle, presence: true

	def self.getAllSubjects
		subjects = Subject.all
		subjects
	end

	def self.getStudyProgram(department, cicle)
		return department.to_s+"-"+cicle.to_s
	end

end
