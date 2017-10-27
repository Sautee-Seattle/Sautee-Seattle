class User < ApplicationRecord
  has_secure_password
  validates :username, :email, { presence: true, uniqueness: true }
  validates :password_digest, { presence: true }
end
