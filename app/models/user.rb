class User < ApplicationRecord
  has_secure_password

  has_many :posts, dependent: :destroy

  validates :username, :email, { presence: true, uniqueness: true }
  validates :password_digest, { presence: true }

  def recipes
    posts.select {|post| post.post_type == "recipe"}
  end

  def locations
    posts.select {|post| post.post_type == "location"}
  end
end
