require 'rails_helper'

RSpec.describe Season, type: :model do
  let!(:season) {create(:season, name: "Fall")}

  context "Attributes" do
    it "has a name" do
      expect(season.name).to eq "Fall"
    end
    it "is valid if name is provided" do
      expect(season.valid?).to eq true
    end
    it "is invalid if name is not provided" do
      season.name = nil
      expect(season).to_not be_valid
    end
  end

end
