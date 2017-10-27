require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of(:username) }
    it { should have_secure_password }
    it { should allow_value(nil).for(:bio) }

  end
end
