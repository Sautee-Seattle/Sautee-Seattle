class Post < ApplicationRecord
  has_many :ingredients_posts
  has_many :ingredients, through: :ingredients_posts
  belongs_to :user

  has_attached_file :image,
    styles: {
      square: '250x250>',
      cropped: '250x250#',
    }

  validates :post_type, :url, presence: true
  validate :title_validation
  validate :body_validation
  validates :title, uniqueness: {scope: :post_type}
  validates_attachment_content_type :image, content_type: ['image/jpg', 'image/jpeg', 'image/png', 'image/gif']

  def is_recipe?
    post_type == "recipe"
  end

  def is_location?
    post_type == "location"
  end

  def title_validation
    if is_location? && !title.present?
      errors[:base] << "Name can't be blank."
    end

    if is_recipe? && !title.present?
      errors[:base] << "Recipe name can't be blank."
    end
  end

  def body_validation
    if is_location? && !body.present?
      errors[:base] << "Address can't be blank."
    end

    if is_recipe? && !body.present?
      errors[:base] << "Directions can't be blank."
    end
  end

  def html_recipe
    self.body.gsub(/\n/, "<p><p/>")
  end

  before_validation do
    if !self.url || self.url == ""
      self.url = "#"
    end

    if is_recipe?
      if !self.image_file_name || self.image_file_name == ""
        self.image=("https://s3-us-west-2.amazonaws.com/seattle-saute/cooking.jpeg")
      end
    end
  end
end
