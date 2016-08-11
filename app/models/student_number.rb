class StudentNumber < ApplicationRecord
	belongs_to :academic_year


    def self.predict_student_number
      accademic_year = AcademicYear.get_current_academic_year
      
      @subjects = Subject.all

      @subjects.each do |subject|
        #subject = Subject.find(187)
        @numbers = StudentNumber.where(subject_id: subject.id).limit(10)
        counter = 0

        @numbers.each do |number| 
          counter += number.student_number
        end
        counter = counter/10

        
        new_record = StudentNumber.create(subject_id: subject.id, predicted_student_number: counter, academic_year_id: accademic_year)

      end
      

      
    end


end
