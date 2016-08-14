class AddElectionDateEndToTeachers < ActiveRecord::Migration[5.0]
  def change
    add_column :teachers, :election_date_end, :datetime
  end
end
