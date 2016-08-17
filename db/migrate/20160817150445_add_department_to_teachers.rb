class AddDepartmentToTeachers < ActiveRecord::Migration[5.0]
  def change
    add_column :teachers, :department_id, :integer
  end
end
