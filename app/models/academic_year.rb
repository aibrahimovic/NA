class AcademicYear < ApplicationRecord
	has_many :ensemble
	has_many :student_number


	def self.start_new_academic_year
		current_academic_year = AcademicYear.last
		name = current_academic_year.name
		from = name[0..3]
		to = name[5..8]
		
		from = from.to_i 
		from += 1
		from = from.to_s

		to = to.to_i
		to += 1
		to = to.to_s

		name = from + "/" + to

		new_academic_year = AcademicYear.new(name: name)
		new_academic_year.save
	end


	def self.get_current_academic_year
		AcademicYear.last.id
	end

end
