class AddStatusToAcademicYears < ActiveRecord::Migration[5.0]
  def change
    add_column :academic_years, :status, :integer
  end
end
