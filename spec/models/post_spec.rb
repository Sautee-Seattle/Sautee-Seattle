require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "validations" do
    it { should validate_presence_of(:post_type) }
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:body) }
    it { should validate_uniqueness_of(:title).scoped_to(:post_type) }
  end

  describe "associations" do
    it { should have_many(:ingredients) }
    it { should belong_to(:user) }
  end
end
