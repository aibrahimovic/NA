class User < ApplicationRecord
	has_many :userRole
	has_secure_password
end
