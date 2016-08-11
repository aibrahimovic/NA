class CreateStudentNumbers < ActiveRecord::Migration[5.0]
  def change
    create_table :student_numbers do |t|
      t.integer :subject_id
      t.integer :predicted_student_number
      t.integer :student_number
      t.string :academic_year

      t.timestamps
    end
  end
end
