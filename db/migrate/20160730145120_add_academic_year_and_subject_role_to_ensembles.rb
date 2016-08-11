class AddAcademicYearAndSubjectRoleToEnsembles < ActiveRecord::Migration[5.0]
  def change
    add_column :ensembles, :academic_year_id, :integer
    add_column :ensembles, :subject_role_id, :integer
  end
end
