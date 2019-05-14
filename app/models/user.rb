class User < ApplicationRecord
  validates :username, uniqueness: true, presence: true
  validates :password, presence: true, confirmation: true
  has_secure_password

end
