class CreateAllSubjectRoles < ActiveRecord::Migration[5.0]
  def change
    create_table :all_subject_roles do |t|
      t.integer :subject_id
      t.integer :subject_role_id

      t.timestamps
    end
  end
end
