class AddDepartmentIdToSubjects < ActiveRecord::Migration[5.0]
  def change
    add_column :subjects, :department_id, :integer
  end
end
