require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    let!(:user1) { create(:user) }
    let!(:user2) { build(:user) }
    it { is_expected.to validate_presence_of(:username) }
    it { is_expected.to validate_presence_of(:password) }
    it { is_expected.to validate_presence_of(:email) }
    it { should have_secure_password }
    it { should allow_value(nil).for(:bio) }
    it { should validate_uniqueness_of(:username) }
    it { should validate_uniqueness_of(:email) }
    it 'should default image to default_profile.png on save' do
      expect(user1.image_file_name).to eq "default_profile.png"
    end
    it "should not have an image when user is not yet saved" do
      expect(user2.image_file_name).to be nil
    end
    it "allows user to choose own image" do
      user3 = create(:user, image_file_name: 'https://static.pexels.com/photos/34950/pexels-photo.jpg')
      expect(User.find(user3.id).image_file_name).to eq 'https://static.pexels.com/photos/34950/pexels-photo.jpg'
    end
  end

  describe "virtual attributes" do
    let(:user) { create(:user_with_recipes_and_locations) }

    it "has many locations" do
      user_locations = User.find(user.id).posts.select {|post| post.post_type == "location"}
      expect(user.locations).to eq(user_locations)
    end

    it "has many recipes" do
      user_recipes = User.find(user.id).posts.select {|post| post.post_type == "recipe"}
      expect(user.recipes).to eq(user_recipes)
    end
  end

  describe "associations" do
    it { should have_many(:posts)}
  end
end
