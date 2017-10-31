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
    it "should default url to # if post_type is location" do
      post = create(:post, post_type: "location", url: '')
      expect(post.url).to eq("#")
    end

    it "should default url to cooking.jpeg if post_type is recipe" do
      post = create(:post, post_type: "recipe", url: nil)
      expect(post.url).to eq("cooking.jpeg")
    end

    it "should default url if url is set to empty string" do
      post = create(:post, post_type: 'recipe', url: "")
      expect(post.url).to eq("cooking.jpeg")
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
  end
end
