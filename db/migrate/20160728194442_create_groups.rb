class CreateGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :groups do |t|
      t.string :label
      t.integer :subject_id
      t.integer :teacher_id
      t.string :academic_year
      t.integer :number_of_students

      t.timestamps
    end
  end
end
