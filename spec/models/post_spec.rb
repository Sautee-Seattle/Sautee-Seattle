require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "validations" do
    it { should validate_presence_of(:post_type) }
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:body) }
    it { should validate_uniqueness_of(:title).scoped_to(:post_type) }
  end

  describe "hooks" do
    let (:user) { create(:user) }
    it "should default url to # if post_type is location" do
      post = create(:post, post_type: "location")
      expect(post.url).to eq("#")
    end

    it "should default url to pan.png if post_type is recipe" do
      post = create(:post, post_type: "recipe")
      expect(post.url).to eq("pan.png")
    end
  end

  describe "associations" do
    it { should have_many(:ingredients) }
    it { should belong_to(:user) }
  end
end
