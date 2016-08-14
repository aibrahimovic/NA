class Privilege < ApplicationRecord
	#belongs_to :role
	has_many :role_privilege
end
