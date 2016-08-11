class Role < ApplicationRecord
	has_many :userRole
	has_many :privilege	
end
