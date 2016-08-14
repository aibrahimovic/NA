class Role < ApplicationRecord
	has_many :userRole
	has_many :user, :through => :userRole
	#has_many :privilege	
	has_many :role_privilege
end
