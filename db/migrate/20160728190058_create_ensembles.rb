class CreateEnsembles < ActiveRecord::Migration[5.0]
  def change
    create_table :ensembles do |t|
      t.integer :subject_id
      t.integer :teacher_id
      t.string :academic_year

      t.timestamps
    end
  end
end
