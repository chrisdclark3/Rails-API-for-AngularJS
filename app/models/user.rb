class User < ActiveRecord::Base
	validates :first_name, :last_name, :email, :password_digest, presence: true
end
