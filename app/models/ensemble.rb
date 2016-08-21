class Ensemble < ApplicationRecord
	belongs_to :teacher
	belongs_to :subject
	belongs_to :subject_role
	belongs_to :academic_year


	def self.get_previous_ensemble
		a_year = AcademicYear.last(2).first
		if @render_previous == true
			@previous_ensemble = Ensemble.where(academic_year_id: a_year).all
			return @previous_ensemble
		else
			return nil
		end 

	end

	def self.set_previous_ensemble

		#@render_previous = true
		a_year = AcademicYear.last(2).first
		ensembles = Ensemble.where(academic_year_id: a_year).all
		academic_year_id = AcademicYear.get_current_academic_year

		if !ensembles.nil?
	      ensembles.each do |item|
	        Ensemble.create(subject_id: item.subject_id, teacher_id: item.teacher_id, subject_role_id: item.subject_role_id, academic_year_id: academic_year_id)
	      end
	    end

	    
	end



end
