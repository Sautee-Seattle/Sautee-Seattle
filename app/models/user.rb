class User < ApplicationRecord
  has_secure_password

  has_many :posts, dependent: :destroy

  validates :username, :email, { presence: true, uniqueness: true }
  validates :password_digest, { presence: true }
end
