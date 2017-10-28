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
  end

  describe "associations" do
    it { should have_many(:posts)}
  end
end
