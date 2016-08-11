class AddGroupNumberToStudentNumbers < ActiveRecord::Migration[5.0]
  def change
    add_column :student_numbers, :group_number, :integer
  end
end
