class Post < ApplicationRecord
  has_many :ingredients_posts
  has_many :ingredients, through: :ingredients_posts
  belongs_to :user

  validates :post_type, :url, presence: true
  validate :title_validation
  validate :body_validation
  validates :title, uniqueness: {scope: :post_type}

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

  before_validation do
    if !self.url || self.url == ""
      if is_recipe?
        self.url = "cooking.jpeg"
      else
        self.url = "#"
      end
    end
  end
end
