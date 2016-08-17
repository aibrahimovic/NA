class Department < ApplicationRecord
	has_many :subjects
	has_many :teachers
end

