class CreateSubjects < ActiveRecord::Migration[5.0]
  def change
    create_table :subjects do |t|
      t.string :code
      t.string :name
      t.integer :number_of_lectures
      t.integer :number_of_exercises
      t.integer :number_of_tutorials
      t.integer :number_of_special_activities
      t.string :study_program
      t.integer :study_cicle

      t.timestamps
    end
  end
end
