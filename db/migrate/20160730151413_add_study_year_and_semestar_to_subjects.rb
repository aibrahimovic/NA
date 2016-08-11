class AddStudyYearAndSemestarToSubjects < ActiveRecord::Migration[5.0]
  def change
    add_column :subjects, :study_year, :integer
    add_column :subjects, :semestar, :integer
  end
end
