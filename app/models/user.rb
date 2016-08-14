class User < ApplicationRecord
	has_many :userRole
	has_many :role, :through => :userRole
	has_secure_password

	validates :first_name, :last_name, presence: true
	validates :username, presence: true, uniqueness: { case_sensitive: false }

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  	validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }


end
