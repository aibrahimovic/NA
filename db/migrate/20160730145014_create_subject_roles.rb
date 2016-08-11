class CreateSubjectRoles < ActiveRecord::Migration[5.0]
  def change
    create_table :subject_roles do |t|
      t.string :name

      t.timestamps
    end
  end
end
