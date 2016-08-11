class AddAcademicYearToStudentNumbers < ActiveRecord::Migration[5.0]
  def change
    add_column :student_numbers, :academic_year_id, :integer
  end
end
