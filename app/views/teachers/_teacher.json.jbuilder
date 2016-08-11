json.extract! teacher, :id, :first_name, :last_name, :title, :position, :election_date, :election_period, :created_at, :updated_at
json.url teacher_url(teacher, format: :json)