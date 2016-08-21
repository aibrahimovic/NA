#status == 0 NA u procesu kreiranja
#status == 1 NA preliminarna verzija
#status == 2 NA finalna verzija

class AcademicYear < ApplicationRecord
	has_many :ensemble
	has_many :student_number

	validates_uniqueness_of :name

	def self.start_new_academic_year
		current_year = DateTime.now.year
		from = current_year
		to = current_year + 1
		name = from.to_s + "/" + to.to_s

		new_academic_year = AcademicYear.new(name: name, status: 0)
		
		if new_academic_year.save
			return true
		else
			return false
		end
	end


	def self.get_current_academic_year
		return AcademicYear.last.id
=begin
		current_year = DateTime.now.year.to_s
		current_academic_year = AcademicYear.last.name
		if current_year == current_academic_year[0..3] || current_year == current_academic_year[5..8]
			return AcademicYear.last.id
		else
			return false
		end
=end
	end

end
