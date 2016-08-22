class StudentNumber < ApplicationRecord
	belongs_to :academic_year
  belongs_to :subject


    def self.predict_student_number
      status = true
      academic_year = AcademicYear.get_current_academic_year
      all_predicted = StudentNumber.uniq.pluck(:academic_year_id)

      last_predicted = all_predicted.include? academic_year

      if last_predicted == true
        status = false
        
      else
      
        @subjects = Subject.all
        @subjects.each do |subject|
          
          @numbers = StudentNumber.where(subject_id: subject.id).limit(10)
          counter = 0

          @numbers.each do |number| 
            if !number.student_number.nil?
              counter += number.student_number
            end
          end
          counter = counter/10

          #group_sizes = Constant.group_sizes[:less_exercises]
          subject_hours = subject.number_of_lectures.to_i + subject.number_of_exercises.to_i + subject.number_of_tutorials.to_i + subject.number_of_special_activities.to_i

          labs = subject.number_of_tutorials + subject.number_of_special_activities

          if labs/subject_hours < 50 && labs/subject_hours > 40
            group_sizes = Constant.group_sizes[:more_exercises]
          elsif labs/subject_hours < 40 && labs/subject_hours > 20
            group_sizes = Constant.group_sizes[:less_exercises]
          else
            group_sizes = Constant.group_sizes[:no_exercises]
          end

          group_number = (counter/group_sizes).ceil
          new_record = StudentNumber.create(subject_id: subject.id, predicted_student_number: counter, academic_year_id: academic_year, group_number: group_number)
        end
      end
      
      return status
    end

    #podaci trebaju biti učitani iz Zamgera - oktobar
    def self.update_student_number
      @student_numbers = StudentNumber.where(student_number: nil).all
      
      if @student_numbers == []
        status = false
      else
        @student_numbers.each do |number|
          number.student_number = number.predicted_student_number
          number.save
        end
        status = true
      end
    end

end
