class User < ActiveRecord::Base
 has_secure_password validations: true
 

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :mail, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  
end
