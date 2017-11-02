require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "validations" do
    it { should validate_presence_of(:post_type) }
    it 'should have a title' do
      post = build(:post, title: "")
      expect(post).to_not be_valid
    end
    it 'blank title should display a specific error message if location' do
      post = build(:location, title: "")
      post.valid?
      expect(post.errors.full_messages).to include("Name can't be blank.")
    end
    it 'should have a body' do
      post = build(:post, body: "")
      expect(post).to_not be_valid
    end
    it "blank body should have specific error message if location" do
      post = build(:location, body: "")
      post.valid?
      expect(post.errors.full_messages).to include("Address can't be blank.")
    end
    it { should validate_uniqueness_of(:title).scoped_to(:post_type) }
  end

  describe "hooks" do
    let (:user) { create(:user) }
    it "should always default url to #" do
      post = create(:post, post_type: "location", url: '')
      expect(post.url).to eq("#")
    end

    it "should default image to cooking.jpeg if post_type is recipe" do
      post = create(:post, post_type: "recipe", url: nil)
      expect(post.image_file_name).to eq("cooking.jpeg")
    end

    it "allows user to choose their own recipe image" do
      post = create(:post, post_type: 'recipe', image_file_name: "https://static.pexels.com/photos/34950/pexels-photo.jpg")
      expect(Post.find(post.id).image_file_name).to eq("https://static.pexels.com/photos/34950/pexels-photo.jpg")
    end

    it "should not change url if it has been explicitly delcared" do
      url = "flimflam.png"
      post = create(:post, post_type: "recipe", url: url)
      expect(post.url).to eq(url)
    end
  end

  describe "associations" do
    it { should have_many(:ingredients) }
    it { should belong_to(:user) }
  end

  describe "virtual attributes" do
    it "is_location? should return true if post is location" do
      location = create(:post, post_type: "location")
      expect(location).to be_is_location
    end

    it "is_recipe? should return true if post is recipe" do
      recipe = create(:post, post_type: "recipe")
      expect(recipe).to be_is_recipe
    end

    it "#html_recipe returns recipe with newline replaced with paragraph tags" do
      recipe = create(:post, post_type: "recipe")
      expect(recipe.html_recipe.include?("\n")).to be false
    end
  end
end
