class User < ApplicationRecord
  has_secure_password
  has_attached_file :image,
    styles: {
      square: '250x250>',
      cropped: '250x250#',
    },
    default_url: "/images/:style/default_profile.png"

  has_many :posts, dependent: :destroy

  validates :username, :email, { presence: true, uniqueness: true }
  validates :password_digest, :image, { presence: true }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  def recipes
    posts.select {|post| post.post_type == "recipe"}
  end

  def locations
    posts.select {|post| post.post_type == "location"}
  end

  before_validation do
    if !self.image || self.image == ""
      self.image = "default_profile.png"
    end
  end
end
